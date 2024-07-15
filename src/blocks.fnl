(local blocks {})
(local config {})


; default configuration for blocks
(set config.block {})
(set config.block.defaults {})
(set config.block.defaults.margin 2)
(set config.block.defaults.margin-x 8)
(set config.block.defaults.width 140)
(set config.block.defaults.auto-fit true)

; configuration for the separator block
(set config.block.separator {})
(set config.block.separator.margin config.block.defaults.margin)
(set config.block.separator.margin-x config.block.defaults.margin-x)
(set config.block.separator.width 28)
(set config.block.separator.text "|")
(set config.block.separator.auto-fit config.block.defaults.auto-fit)

; configuration for the time block
(set config.block.time {})
(set config.block.time.margin config.block.defaults.margin)
(set config.block.time.margin-x config.block.defaults.margin-x)
(set config.block.time.width 100)
(set config.block.time.format "%H:%M")
(set config.block.time.auto-fit config.block.defaults.auto-fit)

; configuration for the power block
(set config.block.power {})
(set config.block.power.width config.block.defaults.width)
(set config.block.power.margin config.block.defaults.margin)
(set config.block.power.margin-x config.block.defaults.margin-x)
(set config.block.power.auto-fit config.block.defaults.auto-fit)

(fn text-to-width [text margin]
  "Given some text to be rendered, try to calculate an appropriate width for the block"
  (let [font (love.graphics.getFont)
        width (font:getWidth text)]
    (+ width margin)))

(set blocks.separator
     (fn [bar]
       (let [renderable-width (. bar :renderable-width)
             content config.block.separator.text
             width (if config.block.separator.auto-fit
               (text-to-width content config.block.separator.margin-x)
               config.block.separator.width)]
         (love.graphics.print 
           content
           (- renderable-width width) 
           config.block.separator.margin)
         (set bar.renderable-width (- renderable-width width))
         bar)))

(set blocks.time 
     (fn [bar]
       (let [time (os.date config.block.time.format)
             content time
             width (if config.block.time.auto-fit
               (text-to-width content config.block.time.margin-x)
               config.block.time.width)
             renderable-width (. bar :renderable-width)]
         (love.graphics.print 
           time 
           (- renderable-width width) 
           config.block.time.margin)
         (set bar.renderable-width (- renderable-width width))
         bar)))

(set blocks.power
     (fn [bar]
       (local (state percent) (love.system.getPowerInfo))
       (let [content (.. state (if percent (.. " " percent) ""))
             width (if config.block.power.auto-fit
                     (text-to-width content config.block.power.margin-x)
                     config.block.power.width)
             renderable-width (. bar :renderable-width)]
         (love.graphics.print 
           content 
           (- renderable-width width) 
           config.block.power.margin)
         (set bar.renderable-width (- renderable-width width))
         bar)))

blocks
