(require "love.timer")
(require "love.system")
(while true
  (local (state percent) (love.system.getPowerInfo))
  (let [channel (love.thread.getChannel "power")]
    (channel:push 
      [state percent]))
  (love.timer.sleep 5))
