(require "love.timer")
(require "love.system")
(var last-result "")
(while true
  (let [time (os.date "blocks.config.block.time.format")]
    (let [channel (love.thread.getChannel "time")
          draw-channel (love.thread.getChannel "draw")]
      (when (not= last-result time)
        (channel:push time)
        (draw-channel:push true)))
    (set last-result time))
  (love.timer.sleep 5))
