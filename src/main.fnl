(local window (require "window.fnl"))
(local renderer (require "renderer.fnl"))
(local fennel (require "fennel"))

(var bar {})
(var minimal-mode false)

(fn love.run []
  (when love.load (love.load (love.arg.parseGameArguments arg) arg))
  (when love.timer (love.timer.step))
  (var dt 0)
  (fn []
    (when love.event
      (love.event.pump)
      (each [name a b c d e f (love.event.poll)]
        (when (= name :quit)
          (when (or (not love.quit) (not (love.quit)))
            (let [___antifnl_rtn_1___ (or a 0)]
              (lua "return ___antifnl_rtn_1___"))))
        ((. love.handlers name) a b c d e f)))
    (when love.timer (set dt (love.timer.step)))
    (when love.update (love.update dt))
    (when (and love.graphics (love.graphics.isActive)) (love.graphics.origin)
      (when love.draw (love.draw))
      (love.graphics.present))
    (when love.timer (love.timer.sleep 0.001))))	

(fn get-config []
  (if minimal-mode
    (let [conf (require "config.fnl")]
      (set conf.blocks conf.minimal-blocks)
      conf)
    (let [user-config (love.filesystem.read "rc.fnl")
          conf (if user-config
                 (fennel.eval user-config)
                 (require "config.fnl"))]
      (set conf.blocks conf.all-blocks)
      conf)))

(fn love.load []
  (let [config (get-config)]
    (love.window.setDisplaySleepEnabled true) 
    (love.graphics.setFont (love.graphics.newFont config.font config.font-size))
    (set bar (window.place-window config.window))
    (set bar (renderer.load-bar bar config))))

(fn love.draw []
  (let [config (get-config)
        bg config.background-color
        fg config.foreground-color
        channel (love.thread.getChannel "draw")]
    (love.graphics.clear bg)
    (love.graphics.setColor fg)
    (if config.render-on-change 
      (when (channel:demand)
        ;; clear the channel draw will run anyway now
        ;; and we don't need to draw again until something else changes
        ;; (channel:clear)
        (set bar (renderer.render-bar bar config)))
      (set bar (renderer.render-bar bar config)))
    (channel:clear)
    (love.timer.sleep config.refresh-seconds))
  (collectgarbage "collect"))

(fn love.threaderror [thread errorstr]
  (print "Thread error!\n" errorstr)
  (print (thread:getError)))

(fn set-minimal-mode []
  (set minimal-mode (not minimal-mode)))

(fn love.keypressed [_key]
  (case _key
    "m" (set-minimal-mode) 
    "escape" (love.event.quit))
  (let [dr (love.thread.getChannel "draw")]
    (dr:push true)))
  
