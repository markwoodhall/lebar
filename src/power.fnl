(require "love.timer")
(require "love.system")
(var last-result "")
(while true
  (local (state percent) (love.system.getPowerInfo))
  (let [channel (love.thread.getChannel "power")
        draw-channel (love.thread.getChannel "draw")]
    (when (not= last-result [state percent])
      (channel:push [state percent])
      (draw-channel:push true)))
  (set last-result [state percent])
  (love.timer.sleep 60))
