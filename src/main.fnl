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

(fn love.load []
  (love.graphics.setFont (love.graphics.newFont config.font config.font-size))
  (set bar (window.place-window config.window))
  (set bar (renderer.load-bar bar)))

(fn love.draw []
  (let [bg config.background-color
        fg config.foreground-color]
    (love.graphics.clear bg)
    (love.graphics.setColor fg)
    (set bar (renderer.render-bar bar)))
  (love.timer.sleep config.refresh-seconds)
  (collectgarbage "collect"))

(fn love.keypressed [_key])

(fn love.threaderror [thread errorstr]
  (print "Thread error!\n" errorstr)
  (print (thread:getError)))
