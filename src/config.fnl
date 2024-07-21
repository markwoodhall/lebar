(local config {})

(local blocks (require "blocks.fnl"))

(set config.background-color 
     [0.11764705882352941 0.12549019607843137 0.18823529411764706])

(set config.foreground-color
     [0.792156862745098  0.8274509803921568 0.9607843137254902])

(set config.refresh-seconds 0.001)

;; When set to true this will cause the render loop to 
;; pause and wait for something to appear on the draw channel
;; When set to false the render loop will onlu pause based on
;; config.refresh-seconds
(set config.render-on-change true)

(set config.font "JetBrainsMonoNerdFont-Regular.ttf")
(set config.font-size 16)

(set config.window {})
(set config.window.position :top)
(set config.window.margin 4)
(set config.window.height 29)

(set config.blocks 
     {:left 
      [blocks.user
       blocks.separator
       blocks.i3-workspace
       blocks.i3-binding-state
       blocks.separator
       blocks.window-title]
      :right 
      [blocks.time 
       blocks.separator
       blocks.power
       blocks.separator
       blocks.memory
       blocks.separator
       blocks.cpu
       blocks.separator
       {:load (partial (. blocks.free-disk-space :load) "/dev/nvme0n1p2" "ssd")
        :draw (partial (. blocks.free-disk-space :draw) "/dev/nvme0n1p2" "ssd" "/ ")}
       blocks.separator
       {:load (partial (. blocks.free-disk-space :load) "/home" "data")
        :draw (partial (. blocks.free-disk-space :draw) "/home" "data" "/home ")}
       blocks.separator
       blocks.pacman]})

config
