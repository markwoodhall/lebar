(local config {})

(local blocks (require "blocks.fnl"))
(local themes (require "themes.fnl"))

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

; set the window position and margins
(set config.window {})
(set config.window.position :top)
(set config.window.margin 4)
(set config.window.height 29)

; set the theme
(set config.theme themes.catppuccin)

; default configuration for blocks
(set config.block {})
(set config.block.defaults {})
(set config.block.defaults.margin 5)
(set config.block.defaults.padding-x 3)
(set config.block.defaults.width 140)
(set config.block.defaults.height 20)
(set config.block.defaults.auto-fit true)
(set config.block.defaults.label "")
(set config.block.defaults.font "JetBrainsMonoNerdFont-Regular.ttf")
(set config.block.defaults.font-size 14)
(set config.block.defaults.radius 4)
(set config.block.defaults.love-font (love.graphics.newFont config.block.defaults.font config.block.defaults.font-size))
(set config.block.defaults.background-color config.theme.black)
(set config.block.defaults.foreground-color config.theme.text)

; configuration for the separator block
(set config.block.separator {})
(set config.block.separator.margin config.block.defaults.margin)
(set config.block.separator.padding-x 2)
(set config.block.separator.radius config.block.defaults.radius)
(set config.block.separator.width config.block.defaults.width)
(set config.block.separator.height config.block.defaults.height)
(set config.block.separator.font config.block.defaults.font)
(set config.block.separator.font-size config.block.defaults.font-size)
(set config.block.separator.love-font (love.graphics.newFont config.block.separator.font config.block.separator.font-size))
(set config.block.separator.text "|")
(set config.block.separator.foreground-color config.theme.gray-2)
(set config.block.separator.background-color config.theme.black)
(set config.block.separator.auto-fit config.block.defaults.auto-fit)

; configuration for the time block
(set config.block.time {})
(set config.block.time.margin config.block.defaults.margin)
(set config.block.time.padding-x config.block.defaults.padding-x)
(set config.block.time.width config.block.defaults.width)
(set config.block.time.height config.block.defaults.height)
(set config.block.time.radius config.block.defaults.radius)
(set config.block.time.format "%%a %%d, %%H:%%M")
(set config.block.time.label config.block.defaults.label)
(set config.block.time.font config.block.defaults.font)
(set config.block.time.font-size config.block.defaults.font-size)
(set config.block.time.love-font (love.graphics.newFont config.block.time.font config.block.time.font-size))
(set config.block.time.foreground-color config.theme.text)
(set config.block.time.background-color config.theme.black)
(set config.block.time.auto-fit config.block.defaults.auto-fit)

; configuration for the power block
(set config.block.power {})
(set config.block.power.width config.block.defaults.width)
(set config.block.power.height config.block.defaults.height)
(set config.block.power.margin config.block.defaults.margin)
(set config.block.power.padding-x config.block.defaults.padding-x)
(set config.block.power.radius config.block.defaults.radius)
(set config.block.power.label config.block.defaults.label)
(set config.block.power.font config.block.defaults.font)
(set config.block.power.font-size config.block.defaults.font-size)
(set config.block.power.love-font (love.graphics.newFont config.block.power.font config.block.power.font-size))
(set config.block.power.foreground-color config.theme.text)
(set config.block.power.background-color config.theme.black)
(set config.block.power.auto-fit config.block.defaults.auto-fit)
(set config.block.power.include-remaining-time true)

; configuration for the shell block
(set config.block.shell {})
(set config.block.shell.width config.block.defaults.width)
(set config.block.shell.height config.block.defaults.height)
(set config.block.shell.margin config.block.defaults.margin)
(set config.block.shell.padding-x config.block.defaults.padding-x)
(set config.block.shell.label config.block.defaults.label)
(set config.block.shell.radius config.block.defaults.radius)
(set config.block.shell.font config.block.defaults.font)
(set config.block.shell.font-size config.block.defaults.font-size)
(set config.block.shell.love-font (love.graphics.newFont config.block.shell.font config.block.shell.font-size))
(set config.block.shell.foreground-color config.block.defaults.foreground-color)
(set config.block.shell.background-color config.block.defaults.background-color)
(set config.block.shell.auto-fit config.block.defaults.auto-fit)

; configuration for the memory block
(set config.block.memory {})
(set config.block.memory.width config.block.defaults.width)
(set config.block.memory.height config.block.defaults.height)
(set config.block.memory.margin config.block.defaults.margin)
(set config.block.memory.padding-x config.block.defaults.padding-x)
(set config.block.memory.radius config.block.defaults.radius)
(set config.block.memory.label " MEM ")
(set config.block.memory.font config.block.defaults.font)
(set config.block.memory.font-size config.block.defaults.font-size)
(set config.block.memory.love-font (love.graphics.newFont config.block.memory.font config.block.memory.font-size))
(set config.block.memory.foreground-color config.theme.text)
(set config.block.memory.background-color config.theme.black)
(set config.block.memory.auto-fit config.block.defaults.auto-fit)

; configuration for the dunst block
(set config.block.dunst {})
(set config.block.dunst.width config.block.defaults.width)
(set config.block.dunst.height config.block.defaults.height)
(set config.block.dunst.margin config.block.defaults.margin)
(set config.block.dunst.padding-x config.block.defaults.padding-x)
(set config.block.dunst.radius config.block.defaults.radius)
(set config.block.dunst.label " ")
(set config.block.dunst.font config.block.defaults.font)
(set config.block.dunst.font-size config.block.defaults.font-size)
(set config.block.dunst.love-font (love.graphics.newFont config.block.dunst.font config.block.dunst.font-size))
(set config.block.dunst.foreground-color config.theme.red)
(set config.block.dunst.background-color config.theme.black)
(set config.block.dunst.auto-fit config.block.defaults.auto-fit)

; configuration for the user block
(set config.block.user {})
(set config.block.user.width config.block.defaults.width)
(set config.block.user.height config.block.defaults.height)
(set config.block.user.margin config.block.defaults.margin)
(set config.block.user.padding-x config.block.defaults.padding-x)
(set config.block.user.radius config.block.defaults.radius)
(set config.block.user.label " ")
(set config.block.user.font config.block.defaults.font)
(set config.block.user.font-size config.block.defaults.font-size)
(set config.block.user.love-font (love.graphics.newFont config.block.user.font config.block.user.font-size))
(set config.block.user.foreground-color config.theme.text)
(set config.block.user.background-color config.theme.gray-2)
(set config.block.user.auto-fit config.block.defaults.auto-fit)

; configuration for the cpu block
(set config.block.cpu {})
(set config.block.cpu.width config.block.defaults.width)
(set config.block.cpu.height config.block.defaults.height)
(set config.block.cpu.margin config.block.defaults.margin)
(set config.block.cpu.padding-x config.block.defaults.padding-x)
(set config.block.cpu.radius config.block.defaults.radius)
(set config.block.cpu.label " CPU ")
(set config.block.cpu.font config.block.defaults.font)
(set config.block.cpu.font-size config.block.defaults.font-size)
(set config.block.cpu.love-font (love.graphics.newFont config.block.cpu.font config.block.cpu.font-size))
(set config.block.cpu.foreground-color config.block.defaults.foreground-color)
(set config.block.cpu.background-color config.block.defaults.background-color)
(set config.block.cpu.auto-fit config.block.defaults.auto-fit)
(set config.block.cpu.ok-threshold 50)

; configuration for the window-title block
(set config.block.window-title {})
(set config.block.window-title.width config.block.defaults.width)
(set config.block.window-title.height config.block.defaults.height)
(set config.block.window-title.margin config.block.defaults.margin)
(set config.block.window-title.padding-x config.block.defaults.padding-x)
(set config.block.window-title.radius config.block.defaults.radius)
(set config.block.window-title.label " ")
(set config.block.window-title.font "JetBrainsMonoNerdFont-Italic.ttf")
(set config.block.window-title.font-size config.block.defaults.font-size)
(set config.block.window-title.love-font (love.graphics.newFont config.block.window-title.font config.block.window-title.font-size))
(set config.block.window-title.foreground-color config.theme.gray-2)
(set config.block.window-title.background-color config.theme.black)
(set config.block.window-title.auto-fit config.block.defaults.auto-fit)

; configuration for the i3-workspace block
(set config.block.i3-workspace {})
(set config.block.i3-workspace.width config.block.defaults.width)
(set config.block.i3-workspace.height config.block.defaults.height)
(set config.block.i3-workspace.margin config.block.defaults.margin)
(set config.block.i3-workspace.padding-x config.block.defaults.padding-x)
(set config.block.i3-workspace.radius config.block.defaults.radius)
(set config.block.i3-workspace.label config.block.defaults.label)
(set config.block.i3-workspace.font config.block.defaults.font)
(set config.block.i3-workspace.font-size config.block.defaults.font-size)
(set config.block.i3-workspace.love-font (love.graphics.newFont config.block.i3-workspace.font config.block.i3-workspace.font-size))
(set config.block.i3-workspace.foreground-color config.theme.black)
(set config.block.i3-workspace.background-color config.theme.green)
(set config.block.i3-workspace.auto-fit config.block.defaults.auto-fit)

; configuration for the free-disk-space block
(set config.block.free-disk-space {})
(set config.block.free-disk-space.width config.block.defaults.width)
(set config.block.free-disk-space.height config.block.defaults.height)
(set config.block.free-disk-space.margin config.block.defaults.margin)
(set config.block.free-disk-space.padding-x config.block.defaults.padding-x)
(set config.block.free-disk-space.radius config.block.defaults.radius)
(set config.block.free-disk-space.label " ")
(set config.block.free-disk-space.font config.block.defaults.font)
(set config.block.free-disk-space.font-size config.block.defaults.font-size)
(set config.block.free-disk-space.love-font (love.graphics.newFont config.block.free-disk-space.font config.block.free-disk-space.font-size))
(set config.block.free-disk-space.foreground-color config.theme.text)
(set config.block.free-disk-space.background-color config.theme.black)
(set config.block.free-disk-space.auto-fit config.block.defaults.auto-fit)

; configuration for the pacman block
(set config.block.pacman {})
(set config.block.pacman.width config.block.defaults.width)
(set config.block.pacman.height config.block.defaults.height)
(set config.block.pacman.margin config.block.defaults.margin)
(set config.block.pacman.padding-x config.block.defaults.padding-x)
(set config.block.pacman.radius config.block.defaults.radius)
(set config.block.pacman.label "  ")
(set config.block.pacman.font config.block.defaults.font)
(set config.block.pacman.font-size config.block.defaults.font-size)
(set config.block.pacman.love-font (love.graphics.newFont config.block.pacman.font config.block.pacman.font-size))
(set config.block.pacman.foreground-color config.theme.text)
(set config.block.pacman.background-color config.theme.black)
(set config.block.pacman.auto-fit config.block.defaults.auto-fit)

; configuration for the i3-binding-state block
(set config.block.i3-binding-state {})
(set config.block.i3-binding-state.width config.block.defaults.width)
(set config.block.i3-binding-state.height config.block.defaults.height)
(set config.block.i3-binding-state.margin config.block.defaults.margin)
(set config.block.i3-binding-state.padding-x config.block.defaults.padding-x)
(set config.block.i3-binding-state.radius config.block.defaults.radius)
(set config.block.i3-binding-state.label " ")
(set config.block.i3-binding-state.font config.block.defaults.font)
(set config.block.i3-binding-state.font-size config.block.defaults.font-size)
(set config.block.i3-binding-state.love-font (love.graphics.newFont config.block.i3-binding-state.font config.block.i3-binding-state.font-size))
(set config.block.i3-binding-state.foreground-color config.theme.black)
(set config.block.i3-binding-state.background-color config.theme.purple)
(set config.block.i3-binding-state.auto-fit config.block.defaults.auto-fit)

; configuration for the wmctrl block
(set config.block.wmctrl {})
(set config.block.wmctrl.width config.block.defaults.width)
(set config.block.wmctrl.height config.block.defaults.height)
(set config.block.wmctrl.margin config.block.defaults.margin)
(set config.block.wmctrl.padding-x config.block.defaults.padding-x)
(set config.block.wmctrl.radius config.block.defaults.radius)
(set config.block.wmctrl.label config.block.defaults.label)
(set config.block.wmctrl.font config.block.defaults.font)
(set config.block.wmctrl.font-size config.block.defaults.font-size)
(set config.block.wmctrl.love-font (love.graphics.newFont config.block.wmctrl.font config.block.wmctrl.font-size))
(set config.block.wmctrl.foreground-color config.theme.black)
(set config.block.wmctrl.background-color config.theme.green)
(set config.block.wmctrl.auto-fit config.block.defaults.auto-fit)

(fn hostname []
  (let [f (io.popen "/bin/hostname")
        host (or (f:read "*a") "")
        host (string.gsub host "\n$" "")]
    (f:close)
    host))

(set config.blocks 
     {:left 
      [blocks.user
       blocks.separator
       blocks.wmctrl
       ;;blocks.i3-workspace
       ;;blocks.i3-binding-state
       ;; blocks.separator
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
       (when (= (hostname) "thinker")
         {:load (partial (. blocks.free-disk-space :load) "/home" "data")
          :draw (partial (. blocks.free-disk-space :draw) "/home" "data" "/home ")})
       (when (= (hostname) "archy")
         {:load (partial (. blocks.free-disk-space :load) "/mnt/data" "data")
          :draw (partial (. blocks.free-disk-space :draw) "/mnt/data" "data" "DATA ")})
       ;;blocks.separator
       ;;blocks.dunst
       blocks.separator
       blocks.pacman]})

config
