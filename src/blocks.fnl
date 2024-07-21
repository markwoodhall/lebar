(local blocks {})
(local config {})

(local themes {})
(set themes.catppuccin {})
(set themes.catppuccin.text [0.792156862745098  0.8274509803921568 0.9607843137254902])
(set themes.catppuccin.gray [0.5019607843137255 0.5294117647058824 0.6352941176470588])
(set themes.catppuccin.gray-1 [0.28627450980392155 0.30196078431372547 0.39215686274509803])
(set themes.catppuccin.gray-2 [0.21176470588235294 0.22745098039215686 0.30980392156862746])
(set themes.catppuccin.gray-3 [0.1411764705882353 0.15294117647058825 0.22745098039215686])
(set themes.catppuccin.red [0.9294117647058824 0.5294117647058824 0.5882352941176471])
(set themes.catppuccin.green [0.6509803921568628 0.8549019607843137 0.5843137254901961])
(set themes.catppuccin.yellow [0.9333333333333333 0.8313725490196079 0.6235294117647059])
(set themes.catppuccin.blue [0.5411764705882353 0.6784313725490196 0.9568627450980393])
(set themes.catppuccin.purple [0.7764705882352941 0.6274509803921569 0.9647058823529412])
(set themes.catppuccin.black [0.11764705882352941 0.12549019607843137 0.18823529411764706])

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

(fn text-to-width [block-config text _margin]
  "Given some text to be rendered, try to calculate an appropriate width for the block"
  (let [font block-config.love-font
        width (font:getWidth text)]
    width))

(fn text-to-height [block-config text _margin]
  "Given some text to be rendered, try to calculate an appropriate height for the block"
  (let [font block-config.love-font
        height (font:getHeight text)]
    height))

(fn bar-print [bar content width height direction block-config]
  (let [renderable-width-right (. bar :renderable-width-right)
        renderable-width-left (. bar :renderable-width-left)]
    (love.graphics.setFont block-config.love-font)
    (case direction
      :right (do 
               (love.graphics.setColor block-config.background-color)
               (love.graphics.rectangle 
                 "fill" 
                 (- renderable-width-right 
                    width 
                    block-config.padding-x) 
                 block-config.margin 
                 (+ block-config.padding-x 
                    block-config.padding-x 
                    width) 
                 (+ (/ block-config.radius 2) height)
                 block-config.radius
                 block-config.radius)
               (love.graphics.setColor block-config.foreground-color)
               (love.graphics.print 
                 content
                 (- renderable-width-right width) 
                 block-config.margin)
               (set bar.renderable-width-right 
                    (- renderable-width-right 
                       (+ block-config.padding-x 
                          block-config.padding-x 
                          width))))
      :left (do 
               (love.graphics.setColor block-config.background-color)
               (love.graphics.rectangle 
                 "fill" 
                 renderable-width-left 
                 block-config.margin 
                 (+ block-config.padding-x 
                    block-config.padding-x 
                    width) 
                 (+ (/ block-config.radius 2) height)
                 block-config.radius 
                 block-config.radius)
               (love.graphics.setColor block-config.foreground-color)
               (love.graphics.print 
                 content
                 (+ renderable-width-left block-config.padding-x) 
                 block-config.margin)
               (set bar.renderable-width-left 
                    (+ renderable-width-left 
                       (+ block-config.padding-x 
                          block-config.padding-x 
                          width)))))

    (love.graphics.setFont block-config.love-font)
    bar))

(set blocks.separator
     (fn [bar direction]
       (let [content config.block.separator.text
             width (if config.block.separator.auto-fit
                     (text-to-width config.block.separator content config.block.separator.padding-x)
                     config.block.separator.width)
             height (if config.block.separator.auto-fit
                      (text-to-height config.block.separator content config.block.separator.margin)
                      config.block.separator.height)]
         (bar-print bar content width height direction config.block.separator))))

(var blocks-state-time {})
(set blocks.time
     {:load
      (fn [bar _direction]
        (local time (love.filesystem.read "time.fnl"))
        (local (parsed _) (string.gsub time "blocks.config.block.time.format" config.block.time.format))
        (local luas (fennel.compile-string parsed))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "time")]
          (if (: channel :peek)
            (let [time (: channel :pop)
                  content (.. " " time)
                  width (if config.block.time.auto-fit
                          (text-to-width config.block.time content config.block.time.padding-x)
                          config.block.time.width)
                  height (if config.block.time.auto-fit
                           (text-to-height config.block.time content config.block.time.margin)
                           config.block.time.height)
                  block-config config.block.time]
              (when time
                (set blocks-state-time {:time time :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-time.content
              (bar-print bar blocks-state-time.content blocks-state-time.width blocks-state-time.height direction config.block.time)
              bar))))})

(fn expand-bar [col bar direction block-config content-fn config-fn]
  (accumulate [b bar
               _ n (ipairs col)]
    (let [content (content-fn n)
          width (if block-config.auto-fit
                  (text-to-width config.block.i3-workspace content block-config.padding-x)
                  block-config.width)
          height (if block-config.auto-fit
                   (text-to-height config.block.i3-workspace content block-config.margin)
                   block-config.height)]
      (config-fn n block-config)
      (let [new-bar (bar-print b content width height direction block-config)]
        (blocks.separator new-bar direction)))))

(var blocks-state-i3-workspace {})
(set blocks.i3-workspace
     {:load
      (fn [bar _direction]
        (local i3 (love.filesystem.read "i3.fnl"))
        (local luas (fennel.compile-string i3))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "i3ws")
              content-fn (fn [i] (. i :name))
              config-fn 
              (fn [i block-config] 
                (let [focused (. i :focused)]
                  (if focused
                    (do
                      (set block-config.foreground-color config.theme.black)
                      (set block-config.background-color config.theme.green))
                    (do
                      (set block-config.foreground-color config.theme.black)
                      (set block-config.background-color config.theme.gray)))))]
          (set config.block.i3-workspace.foreground-color config.theme.black)
          (set config.block.i3-workspace.background-color config.theme.green)
          (if (channel:peek)
            (let [ws (channel:pop)
                  workspaces (icollect [v (ws:gmatch "[^,]+")]
                               (let [t (v:gmatch "[^%-]+")]
                                 {:name (t) :focused (= (t) "true")}))

                  block-config config.block.i3-workspace]
              (when ws
                (set blocks-state-i3-workspace {:i3-workspace ws :workspaces workspaces}))
              (expand-bar workspaces bar direction block-config content-fn config-fn))
            (if blocks-state-i3-workspace.workspaces
              (expand-bar blocks-state-i3-workspace.workspaces bar direction config.block.i3-workspace content-fn config-fn)
              bar))))})

(var blocks-state-i3-binding-state {})
(set blocks.i3-binding-state
     {:load
      (fn [bar _direction]
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "i3bs")]
          (if (channel:peek)
            (let [block-config config.block.i3-binding-state
                  ws (channel:pop)
                  content (.. block-config.label ws)
                  width (if config.block.i3-binding-state.auto-fit
                            (text-to-width config.block.i3-binding-state content config.block.i3-binding-state.padding-x)
                            config.block.i3-binding-state.width)
                  height (if config.block.i3-binding-state.auto-fit
                           (text-to-height config.block.i3-binding-state content config.block.i3-binding-state.margin)
                           config.block.i3-binding-state.height)]
              (when ws
                (set blocks-state-i3-binding-state {:i3-binding-state ws :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-i3-binding-state.content
              (bar-print bar blocks-state-i3-binding-state.content blocks-state-i3-binding-state.width blocks-state-i3-binding-state.height direction config.block.i3-binding-state)
              bar))))})

(var blocks-state-memory {})
(set blocks.memory
     {:load
      (fn [bar _direction]
        (local memory (love.filesystem.read "memory.fnl"))
        (local luas (fennel.compile-string memory))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "memory")]
          (if (channel:peek)
            (let [block-config config.block.memory 
                  channel (love.thread.getChannel "memory")
                  memory (channel:pop)
                  content (.. block-config.label memory)
                  width (if block-config.auto-fit
                          (text-to-width block-config content block-config.padding-x)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content block-config.margin)
                           block-config.height)]
              (when memory
                (set blocks-state-memory {:memory memory :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-memory.content
              (bar-print bar blocks-state-memory.content blocks-state-memory.width blocks-state-memory.height direction config.block.memory)
              bar))))})

(var blocks-state-user {})
(set blocks.user
     {:load
      (fn [bar _direction]
        (local user (love.filesystem.read "user.fnl"))
        (local luas (fennel.compile-string user))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "user")]
          (if (channel:peek)
            (let [block-config config.block.user 
                  channel (love.thread.getChannel "user")
                  user (channel:pop)
                  content (.. block-config.label user)
                  width (if block-config.auto-fit
                          (text-to-width block-config content block-config.padding-x)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content block-config.margin)
                           block-config.height)]
              (when user
                (set blocks-state-user {:user user :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-user.content
              (bar-print bar blocks-state-user.content blocks-state-user.width blocks-state-user.height direction config.block.user)
              bar))))})

(var blocks-state-power {})
(set blocks.power
     {:load
      (fn [bar _direction]
        (local power (love.filesystem.read "power.fnl"))
        (local luas (fennel.compile-string power))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "power")]
          (if (: channel :peek)
            (let [power (: channel :pop)
                  [state percent hours] (if power power ["nobattery" nil])
                  content (.. state (if percent (.. " " percent "%") ""))
                  content (case state
                            "charging" (.. "" (if percent (.. " " percent "%") ""))
                            "battery" 
                            (case percent
                              (where p (< p 10)) (.. "" (if percent (.. "  " percent "%") ""))
                              (where p (< p 30)) (.. "" (if percent (.. "  " percent "%") ""))
                              (where p (< p 50)) (.. "" (if percent (.. "  " percent "%") ""))
                              (where p (< p 80)) (.. "" (if percent (.. "  " percent "%") ""))
                              (where p (< p 100)) (.. "" (if percent (.. "  " percent "%") ""))
                              _ (.. "" (if percent (.. " " percent "%") "")))
                            "charged" (.. "" (if percent (.. " " percent "%") ""))
                            "nobattery" (.. "" " AC")
                            _ content)
                  remaining (if (and config.block.power.include-remaining-time (not= state "nobattery")) (.. " " (string.format "%.2f" hours) "(h)") "")
                  content (if hours (.. content  remaining) content)
                  width (if config.block.power.auto-fit
                          (text-to-width config.block.power content config.block.power.padding-x)
                          config.block.power.width)
                  height (if config.block.power.auto-fit
                           (text-to-height config.block.power content config.block.power.margin)
                           config.block.power.height)
                  block-config config.block.power]
              (when (= state "battery")
                (case percent
                  (where p (<= p 50 )) 
                  (do 
                    (set block-config.foreground-color config.theme.black)
                    (set block-config.background-color config.theme.red))))
              (when (= state "charging")
                (set block-config.foreground-color config.theme.yellow))
              (when power
                (set blocks-state-power {:power power :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-power.content
              (bar-print bar blocks-state-power.content blocks-state-power.width blocks-state-power.height direction config.block.power)
              bar))))})

(var blocks-state-pacman {})
(set blocks.pacman
     {:load
      (fn [bar _direction]
        (local pacman (love.filesystem.read "pacman.fnl"))
        (local luas (fennel.compile-string pacman))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "pacman")]
          (if (channel:peek)
            (let [block-config config.block.pacman
                  pacman (channel:pop)
                  content (.. block-config.label (..  pacman " update(s)"))
                  width (if config.block.pacman.auto-fit
                          (text-to-width config.block.pacman content config.block.pacman.padding-x)
                          config.block.pacman.width)
                  height (if config.block.pacman.auto-fit
                           (text-to-height config.block.pacman content config.block.pacman.margin)
                           config.block.pacman.height)]
              (case (tonumber pacman)
                (where p (<= p 50)) (set block-config.foreground-color config.theme.green)
                (where p (<= p 100)) (set block-config.foreground-color config.theme.yellow)
                (where p (> p 100)) (set block-config.foreground-color config.theme.red))
              (when pacman
                (set blocks-state-pacman {:pacman pacman :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-pacman.content
              (bar-print bar blocks-state-pacman.content blocks-state-pacman.width blocks-state-pacman.height direction config.block.pacman)
              bar))))})

(fn thread-shell-command [command]
  (: (love.thread.newThread (tostring command)) :start))

(set blocks.thread-shell-command thread-shell-command)

(var blocks-state-cpu-last 0)
(set blocks.cpu
     {:load
      (fn [bar _direction]
        (local cpu (love.filesystem.read "cpu.fnl"))
        (local luas (fennel.compile-string cpu))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [block-config config.block.cpu 
              channel (love.thread.getChannel "cpu")
              cpu-percentage (: channel :pop)
              content (.. block-config.label (or cpu-percentage blocks-state-cpu-last) "%")
              width (if block-config.auto-fit
                      (text-to-width block-config content block-config.padding-x)
                      block-config.width)
              height (if block-config.auto-fit
                       (text-to-height block-config content block-config.margin)
                       block-config.height)]
          (when (and cpu-percentage (tonumber cpu-percentage))
            (if (> (tonumber cpu-percentage) block-config.ok-threshold)
              (do 
                (set block-config.background-color config.theme.red)
                (set block-config.foreground-color config.theme.black))
              (do 
                (set block-config.background-color config.theme.green)
                (set block-config.foreground-color config.theme.black))))
          (when (tonumber cpu-percentage)
            (set blocks-state-cpu-last (tonumber cpu-percentage)))
          (bar-print bar content width height direction block-config)))})

(var blocks-state-window-title {})
(set blocks.window-title
     {:load
      (fn [bar _direction]
        (local window-title (love.filesystem.read "xwindow.fnl"))
        (local luas (fennel.compile-string window-title))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction]
        (let [channel (love.thread.getChannel "window-title")]
          (if (: channel :peek)
            (let [window-title (: channel :pop)
                  content (.. window-title)
                  width (if config.block.window-title.auto-fit
                          (text-to-width config.block.window-title content config.block.window-title.padding-x)
                          config.block.window-title.width)
                  height (if config.block.window-title.auto-fit
                           (text-to-height config.block.window-title content config.block.window-title.margin)
                           config.block.window-title.height)
                  block-config config.block.window-title]
              (when window-title
                (set blocks-state-window-title {:window-title window-title :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-window-title.content
              (bar-print bar blocks-state-window-title.content blocks-state-window-title.width blocks-state-window-title.height direction config.block.window-title)
              bar))))})

(var blocks-state-free-disk-space {})
(set blocks.free-disk-space
     {:load
      (fn [mount id bar _direction]
        (local free-disk-space (love.filesystem.read "disk.fnl"))
        (local (with-id _) (string.gsub free-disk-space "blocks%.config%.block%.free%-disk%-space%.id" id))
        (local (with-mount _) (string.gsub with-id "blocks%.config%.block%.free%-disk%-space%.mount" mount))
        (local luas (fennel.compile-string with-mount))
        (blocks.thread-shell-command luas)
        (tset blocks-state-free-disk-space id {})
        bar)
      :draw 
      (fn [mount id bar direction]
        (let [channel (love.thread.getChannel (.. mount ".disk"))]
          (if (channel:peek)
            (let [block-config config.block.free-disk-space 
                  free-disk-space (channel:pop)
                  content (.. block-config.label free-disk-space)
                  width (if block-config.auto-fit
                          (text-to-width block-config content block-config.padding-x)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content block-config.margin)
                           block-config.height)]
              (when free-disk-space
                (tset blocks-state-free-disk-space id {:free-disk-space free-disk-space :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if (. (. blocks-state-free-disk-space id) :content)
              (let [state (. blocks-state-free-disk-space id)]
                (bar-print bar state.content state.width state.height direction config.block.free-disk-space))
              bar))))})

blocks
