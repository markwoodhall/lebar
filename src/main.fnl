(local os (require :os))
(local config (require "config.fnl"))
(local window (require "window.fnl"))
(local renderer (require "renderer.fnl"))

(fn love.load []
  ;; start a thread listening on stdin
  (: (love.thread.newThread "require('love.event')
while 1 do love.event.push('stdin', io.read('*line')) end") :start))

(fn love.handlers.stdin [line]
  ;; evaluate lines read from stdin as fennel code
  (if (= line "quit") (os.exit)
    (let [(ok val) (pcall fennel.eval line)]
      (print (if ok (fennel.view val) val)))))

(var min-dt nil)
(var next-time nil)
(var bar {})

(fn love.load []
  (set min-dt config.frame-rate)
  (set next-time (love.timer.getTime))
  (love.graphics.setFont (love.graphics.newFont config.font config.font-size))
  (set bar (window.place-window config.window)))

(fn love.draw []
  (let [bg config.background-color
        fg config.foreground-color]
    (love.graphics.clear bg)
    (love.graphics.setColor fg)


    (set bar (renderer.render-bar bar)))
  
  (let [cur-time (love.timer.getTime)]
    (if (> next-time cur-time)
      (love.timer.sleep (- cur-time next-time))
      (set next-time cur-time)))
  
  (collectgarbage "collect"))

(fn love.keypressed [_key])

(fn love.update [_dt]
  (set next-time (+ next-time min-dt)))
