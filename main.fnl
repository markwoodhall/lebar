(local os (require :os))

(local default-height 30)

(fn love.load []
  ;; start a thread listening on stdin
  (: (love.thread.newThread "require('love.event')
while 1 do love.event.push('stdin', io.read('*line')) end") :start))

(fn love.handlers.stdin [line]
  ;; evaluate lines read from stdin as fennel code
  (if (= line "quit") (os.exit)
    (let [(ok val) (pcall fennel.eval line)]
      (print (if ok (fennel.view val) val)))))

(fn love.load []
  (let [width (love.window.getDesktopDimensions)]
    (love.window.setMode width default-height {:resizable false :fullscreen false :vsync true})
    (love.window.setPosition 0 0)))

(fn love.draw []
  (let [bg [0.11764705882352941 0.11764705882352941 0.1803921568627451 1]
        fg [1 1 1 1]
        time (os.date "%H:%M:%S")
        width (love.window.getDesktopDimensions)]
    (love.graphics.clear bg)
    (love.graphics.setColor fg)
    (love.graphics.print time (- width 70) (/ default-height 4))))

(fn love.keypressed [_key]
  (love.event.quit))
