(local lib {})

(set lib.default-settings 
     (fn [theme]
       (var block {})
       (set block {})
       (set block.margin 3)
       (set block.padding-x 3)
       (set block.width 140)
       (set block.height 20)
       (set block.auto-fit true)
       (set block.label "")
       (set block.font "JetBrainsMonoNerdFont-Regular.ttf")
       (set block.font-size 14)
       (set block.radius 6)
       (set block.love-font (love.graphics.newFont block.font block.font-size))
       (set block.background-color theme.black)
       (set block.foreground-color theme.text)
       block))

lib
