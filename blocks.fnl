(local blocks {})
(local config {})


; default configuration for blocks
(set config.block {})
(set config.block.defaults {})
(set config.block.defaults.margin 2)
(set config.block.defaults.width 140)

; configuration for the separator block
(set config.block.separator {})
(set config.block.separator.margin config.block.defaults.margin)
(set config.block.separator.width 28)
(set config.block.separator.text " | ")

; configuration for the time block
(set config.block.time {})
(set config.block.time.margin config.block.defaults.margin)
(set config.block.time.width 100)

; configuration for the power block
(set config.block.power {})
(set config.block.power.width config.block.defaults.width)
(set config.block.power.margin config.block.defaults.margin)

(set blocks.separator
     (fn [bar]
       (let [renderable-width (. bar :renderable-width)]
         (love.graphics.print 
           config.block.separator.text
           (- renderable-width config.block.separator.width) 
           config.block.separator.margin)
         (set bar.renderable-width (- renderable-width config.block.separator.width))
         bar)))

(set blocks.time 
     (fn [bar]
       (let [time (os.date "%H:%M:%S")
             renderable-width (. bar :renderable-width)]
         (love.graphics.print 
           time 
           (- renderable-width config.block.time.width) 
           config.block.time.margin)
         (set bar.renderable-width (- renderable-width config.block.time.width))
         bar)))

(set blocks.power
     (fn [bar]
       (local (state percent) (love.system.getPowerInfo))
       (let [renderable-width (. bar :renderable-width)]
         (love.graphics.print 
           (.. state " " (if percent percent "")) 
           (- renderable-width config.block.power.width) 
           config.block.power.margin)
         (set bar.renderable-width (- renderable-width config.block.power.width))
         bar)))

blocks
