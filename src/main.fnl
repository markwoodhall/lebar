(local os (require :os))
(local config (require "config.fnl"))
(local window (require "window.fnl"))
(local renderer (require "renderer.fnl"))

(fn love.handlers.stdin [line]
  ;; evaluate lines read from stdin as fennel code
  (if (= line "quit") (os.exit)
    (let [(ok val) (pcall fennel.eval line)]
      (print (if ok (fennel.view val) val)))))

(var bar {})

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

(fn love.load []
  (love.window.setDisplaySleepEnabled true) 
  (love.graphics.setFont (love.graphics.newFont config.font config.font-size))
  (set bar (window.place-window config.window))
  (set bar (renderer.load-bar bar)))

(fn love.draw []
  (let [bg config.background-color
        fg config.foreground-color
        channel (love.thread.getChannel "draw")]
    (love.graphics.clear bg)
    (love.graphics.setColor fg)
    (if config.render-on-change 
      (when (or (channel:demand))
        ;; clear the channel draw will run anyway now
        ;; and we don't need to draw again until something else changes
        ;; (channel:clear)
        (set bar (renderer.render-bar bar)))
      (set bar (renderer.render-bar bar)))
    (channel:clear)
    (love.timer.sleep config.refresh-seconds))
  (collectgarbage "collect"))

(fn love.keypressed [_key])

(fn love.threaderror [thread errorstr]
  (print "Thread error!\n" errorstr)
  (print (thread:getError)))
