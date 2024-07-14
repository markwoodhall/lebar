(local blocks {})

(set blocks.time 
     (fn [bar]
       (let [time (os.date "%H:%M:%S")
             width (. bar :width)]
         (love.graphics.print time (- width 100) 2)
         {:x (- width 100)})))

(set blocks.power
     (fn [bar]
       (let [[ state percent _] (love.system.getPowerInfo)
             width (. bar :width)]
         (love.graphics.print state percent (- width 200) 2)
         {:x (- width 200)})))

blocks
