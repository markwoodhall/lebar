(local config {})

(local blocks (require "blocks.fnl"))

(set config.background-color 
     [0.11764705882352941 0.11764705882352941 0.1803921568627451 1])

(set config.foreground-color
     [0.6470588235294118 0.6784313725490196 0.796078431372549 1])

(set config.frame-rate 0.000001)

(set config.font "JetBrainsMonoNerdFont-Regular.ttf")
(set config.font-size 18)

(set config.window {})
(set config.window.position :top)
(set config.window.margin 5)
(set config.window.height 28)

(set config.blocks 
     {:left 
      [blocks.window-title 
       blocks.separator
       blocks.i3-workspace
       blocks.separator
       blocks.i3-binding-state]
      :right 
      [blocks.time 
       blocks.separator
       blocks.power
       blocks.separator
       blocks.memory
       blocks.separator
       blocks.cpu
       blocks.separator
       blocks.free-disk-space]})

config
