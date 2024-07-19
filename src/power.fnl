(require "love.timer")
(require "love.system")
(var last-result "")
(while true
  (local (state percent) (love.system.getPowerInfo))
  (let [channel (love.thread.getChannel "power")
        draw-channel (love.thread.getChannel "draw")]
    (when (and (= 0 (channel:getCount)) (not= last-result [state percent]))
      (channel:push [state percent])
      (draw-channel:supply true)))
  (set last-result [state percent])
  (if (= state "nobattery") 
    (love.timer.sleep 1000)
    (love.timer.sleep 60)))
