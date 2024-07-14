(local config {})

(local blocks (require "blocks.fnl"))

(set config.background-color 
     [0.11764705882352941 0.11764705882352941 0.1803921568627451 1])

(set config.foreground-color
     [1 1 1 1])

(set config.frame-rate 30)

(set config.font "JetBrainsMonoNerdFont-Regular.ttf")
(set config.font-size 18)

(set config.window {})
(set config.window.position :top)
(set config.window.margin 5)
(set config.window.height 30)

(set config.blocks [blocks.time blocks.power])

config
