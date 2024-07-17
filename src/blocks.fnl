(local blocks {})
(local config {})

(local themes {})
(set themes.catppuccin {})
(set themes.catppuccin.text [0.792156862745098  0.8274509803921568 0.9607843137254902])
(set themes.catppuccin.red [0.9294117647058824 0.5294117647058824 0.5882352941176471])
(set themes.catppuccin.green [0.6509803921568628 0.8549019607843137 0.5843137254901961])
(set themes.catppuccin.black [0.11764705882352941 0.12549019607843137 0.18823529411764706])

(set config.theme themes.catppuccin)

; default configuration for blocks
(set config.block {})
(set config.block.defaults {})
(set config.block.defaults.margin 5)
(set config.block.defaults.margin-x 2)
(set config.block.defaults.width 140)
(set config.block.defaults.height 20)
(set config.block.defaults.auto-fit true)
(set config.block.defaults.font "JetBrainsMonoNerdFont-Regular.ttf")
(set config.block.defaults.font-size 16)
(set config.block.defaults.background-color config.theme.black)
(set config.block.defaults.foreground-color config.theme.text)

; configuration for the separator block
(set config.block.separator {})
(set config.block.separator.margin config.block.defaults.margin)
(set config.block.separator.margin-x config.block.defaults.margin-x)
(set config.block.separator.width config.block.defaults.width)
(set config.block.separator.height config.block.defaults.height)
(set config.block.separator.font config.block.defaults.font)
(set config.block.separator.font-size config.block.defaults.font-size)
(set config.block.separator.text " ")
(set config.block.separator.foreground-color config.block.defaults.foreground-color)
(set config.block.separator.background-color config.block.defaults.background-color)
(set config.block.separator.auto-fit config.block.defaults.auto-fit)

; configuration for the time block
(set config.block.time {})
(set config.block.time.margin config.block.defaults.margin)
(set config.block.time.margin-x config.block.defaults.margin-x)
(set config.block.time.width config.block.defaults.width)
(set config.block.time.height config.block.defaults.height)
(set config.block.time.format "%H:%M:%S")
(set config.block.time.font config.block.defaults.font)
(set config.block.time.font-size config.block.defaults.font-size)
(set config.block.time.foreground-color config.theme.text)
(set config.block.time.background-color config.theme.black)
(set config.block.time.auto-fit config.block.defaults.auto-fit)

; configuration for the power block
(set config.block.power {})
(set config.block.power.width config.block.defaults.width)
(set config.block.power.height config.block.defaults.height)
(set config.block.power.margin config.block.defaults.margin)
(set config.block.power.margin-x config.block.defaults.margin-x)
(set config.block.power.font config.block.defaults.font)
(set config.block.power.font-size config.block.defaults.font-size)
(set config.block.power.foreground-color config.theme.text)
(set config.block.power.background-color config.theme.black)
(set config.block.power.auto-fit config.block.defaults.auto-fit)

; configuration for the shell block
(set config.block.shell {})
(set config.block.shell.width config.block.defaults.width)
(set config.block.shell.height config.block.defaults.height)
(set config.block.shell.margin config.block.defaults.margin)
(set config.block.shell.margin-x config.block.defaults.margin-x)
(set config.block.shell.font config.block.defaults.font)
(set config.block.shell.font-size config.block.defaults.font-size)
(set config.block.shell.foreground-color config.block.defaults.foreground-color)
(set config.block.shell.background-color config.block.defaults.background-color)
(set config.block.shell.auto-fit config.block.defaults.auto-fit)

; configuration for the memory block
(set config.block.memory {})
(set config.block.memory.width config.block.defaults.width)
(set config.block.memory.height config.block.defaults.height)
(set config.block.memory.margin config.block.defaults.margin)
(set config.block.memory.margin-x config.block.defaults.margin-x)
(set config.block.memory.font config.block.defaults.font)
(set config.block.memory.font-size config.block.defaults.font-size)
(set config.block.memory.foreground-color config.block.defaults.foreground-color)
(set config.block.memory.background-color config.block.defaults.background-color)
(set config.block.memory.auto-fit config.block.defaults.auto-fit)

; configuration for the cpu block
(set config.block.cpu {})
(set config.block.cpu.width config.block.defaults.width)
(set config.block.cpu.height config.block.defaults.height)
(set config.block.cpu.margin config.block.defaults.margin)
(set config.block.cpu.margin-x config.block.defaults.margin-x)
(set config.block.cpu.font config.block.defaults.font)
(set config.block.cpu.font-size config.block.defaults.font-size)
(set config.block.cpu.foreground-color config.block.defaults.foreground-color)
(set config.block.cpu.background-color config.block.defaults.background-color)
(set config.block.cpu.auto-fit config.block.defaults.auto-fit)
(set config.block.cpu.ok-threshold 50)
(set config.block.cpu.last-cpu 0)

; configuration for the window-title block
(set config.block.window-title {})
(set config.block.window-title.width config.block.defaults.width)
(set config.block.window-title.height config.block.defaults.height)
(set config.block.window-title.margin config.block.defaults.margin)
(set config.block.window-title.margin-x config.block.defaults.margin-x)
(set config.block.window-title.font "JetBrainsMonoNerdFont-Italic.ttf")
(set config.block.window-title.font-size config.block.defaults.font-size)
(set config.block.window-title.foreground-color config.theme.text)
(set config.block.window-title.background-color config.theme.black)
(set config.block.window-title.auto-fit config.block.defaults.auto-fit)

; configuration for the i3-workspace block
(set config.block.i3-workspace {})
(set config.block.i3-workspace.width config.block.defaults.width)
(set config.block.i3-workspace.height config.block.defaults.height)
(set config.block.i3-workspace.margin config.block.defaults.margin)
(set config.block.i3-workspace.margin-x config.block.defaults.margin-x)
(set config.block.i3-workspace.font config.block.defaults.font)
(set config.block.i3-workspace.font-size config.block.defaults.font-size)
(set config.block.i3-workspace.foreground-color config.block.defaults.foreground-color)
(set config.block.i3-workspace.background-color config.block.defaults.background-color)
(set config.block.i3-workspace.auto-fit config.block.defaults.auto-fit)

; configuration for the i3-workspaces block
(set config.block.i3-workspaces {})
(set config.block.i3-workspaces.width config.block.defaults.width)
(set config.block.i3-workspaces.height config.block.defaults.height)
(set config.block.i3-workspaces.margin config.block.defaults.margin)
(set config.block.i3-workspaces.margin-x config.block.defaults.margin-x)
(set config.block.i3-workspaces.font config.block.defaults.font)
(set config.block.i3-workspaces.font-size config.block.defaults.font-size)
(set config.block.i3-workspaces.foreground-color config.block.defaults.foreground-color)
(set config.block.i3-workspaces.background-color config.block.defaults.background-color)
(set config.block.i3-workspaces.auto-fit config.block.defaults.auto-fit)

; configuration for the free-disk-space block
(set config.block.free-disk-space {})
(set config.block.free-disk-space.width config.block.defaults.width)
(set config.block.free-disk-space.height config.block.defaults.height)
(set config.block.free-disk-space.margin config.block.defaults.margin)
(set config.block.free-disk-space.margin-x config.block.defaults.margin-x)
(set config.block.free-disk-space.font config.block.defaults.font)
(set config.block.free-disk-space.font-size config.block.defaults.font-size)
(set config.block.free-disk-space.foreground-color config.block.defaults.foreground-color)
(set config.block.free-disk-space.background-color config.block.defaults.background-color)
(set config.block.free-disk-space.auto-fit config.block.defaults.auto-fit)

; configuration for the i3-binding-state block
(set config.block.i3-binding-state {})
(set config.block.i3-binding-state.width config.block.defaults.width)
(set config.block.i3-binding-state.height config.block.defaults.height)
(set config.block.i3-binding-state.margin config.block.defaults.margin)
(set config.block.i3-binding-state.margin-x config.block.defaults.margin-x)
(set config.block.i3-binding-state.font config.block.defaults.font)
(set config.block.i3-binding-state.font-size config.block.defaults.font-size)
(set config.block.i3-binding-state.foreground-color config.block.defaults.foreground-color)
(set config.block.i3-binding-state.background-color config.block.defaults.background-color)
(set config.block.i3-binding-state.auto-fit config.block.defaults.auto-fit)

(fn text-to-width [text margin]
  "Given some text to be rendered, try to calculate an appropriate width for the block"
  (let [font (love.graphics.getFont)
        width (font:getWidth text)]
    (+ width margin margin)))

(fn text-to-height [text _margin]
  "Given some text to be rendered, try to calculate an appropriate height for the block"
  (let [font (love.graphics.getFont)
        height (font:getHeight text)]
    height))

(fn bar-print [bar content width height direction block-config]
  (let [renderable-width-right (. bar :renderable-width-right)
        renderable-width-left (. bar :renderable-width-left)]
    (love.graphics.setFont (love.graphics.newFont block-config.font block-config.font-size))
    (case direction
      :right (do 
               (love.graphics.setColor block-config.background-color)
               (love.graphics.rectangle "fill" (- renderable-width-right width) block-config.margin width height)
               (love.graphics.setColor block-config.foreground-color)
               (love.graphics.print 
                 content
                 (+ block-config.margin-x (- renderable-width-right width)) 
                 block-config.margin)
               (set bar.renderable-width-right (- renderable-width-right width)))
      :left (do 
              (love.graphics.setColor block-config.background-color)
              (love.graphics.rectangle "fill" renderable-width-left block-config.margin width height)
              (love.graphics.setColor block-config.foreground-color)
              (love.graphics.print
                content
                (+ block-config.margin-x renderable-width-left)
                block-config.margin)
              (set bar.renderable-width-left (+ renderable-width-left width))))

    (love.graphics.setFont (love.graphics.newFont config.block.defaults.font 20))
    bar))

(set blocks.separator
     (fn [bar direction]
       (let [content config.block.separator.text
             width (if config.block.separator.auto-fit
                     (text-to-width content config.block.separator.margin-x)
                     config.block.separator.width)
             height (if config.block.separator.auto-fit
                      (text-to-height content config.block.separator.margin)
                      config.block.separator.height)]
         (bar-print bar content width height direction config.block.separator))))

(set blocks.time 
     (fn [bar direction]
       (let [time (os.date config.block.time.format)
             content time
             width (if config.block.time.auto-fit
                     (text-to-width content config.block.time.margin-x)
                     config.block.time.width)
             height (if config.block.time.auto-fit
                     (text-to-height content config.block.time.margin)
                     config.block.time.height)]
         (bar-print bar content width height direction config.block.time))))

(set blocks.power
     (fn [bar direction]
       (local (state percent) (love.system.getPowerInfo))
       (let [content (.. state (if percent (.. " " percent "%") ""))
             content (if (= content "nobattery")
                       "AC"
                       content)
             width (if config.block.power.auto-fit
                     (text-to-width content config.block.power.margin-x)
                     config.block.power.width)
             height (if config.block.power.auto-fit
                     (text-to-height content config.block.power.margin)
                     config.block.power.height)
             block-config config.block.power]
         (when (= state "battery")
          (set block-config.foreground-color config.theme.red))
         (bar-print bar content width height direction block-config))))

(fn shell-command [command]
  (let [handle (io.popen command)
        result (handle:read "*l")]
    (handle:close)
    (if result
      (-> result
          (string.gsub "\"" "")
          (string.gsub "^%s*(.-)%s*$" "%1"))
      "")))

(set blocks.shell-command shell-command)

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
              content (.. "CPU " (or cpu-percentage blocks-state-cpu-last) "%")
              width (if block-config.auto-fit
                      (text-to-width content block-config.margin-x)
                      block-config.width)
              height (if block-config.auto-fit
                       (text-to-height content block-config.margin)
                       block-config.height)]
          (when (and cpu-percentage (tonumber cpu-percentage))
            (if (> (tonumber cpu-percentage) block-config.ok-threshold)
              (set block-config.foreground-color config.theme.red)
              (set block-config.foreground-color config.theme.green)))
          (when (tonumber cpu-percentage)
            (set blocks-state-cpu-last (tonumber cpu-percentage)))
          (bar-print bar content width height direction block-config)))})

(set blocks.i3-workspace
     (fn [bar direction]
       (let [block-config config.block.i3-workspace 
             i3-ws (shell-command "i3-msg -s $(i3 --get-socketpath) -t get_workspaces | jq -r '.[] | select(.focused==true) | .name'")
             content i3-ws
             width (if block-config.auto-fit
                     (text-to-width content block-config.margin-x)
                     block-config.width)
             height (if block-config.auto-fit
                     (text-to-height content block-config.margin)
                     block-config.height)] 
       (set block-config.foreground-color config.theme.green)
       (bar-print bar content width height direction block-config))))

(set blocks.i3-workspaces
     (fn [bar direction]
       (let [block-config config.block.i3-workspaces
             i3-ws (shell-command "i3-msg -s $(i3 --get-socketpath) -t get_workspaces | jq -r '.[] | select(.focused==false) | .name' | paste -sd \"-\" -")
             content i3-ws
             width (if block-config.auto-fit
                     (text-to-width content block-config.margin-x)
                     block-config.width)
             height (if block-config.auto-fit
                      (text-to-height content block-config.margin)
                      block-config.height)]
       (bar-print bar content width height direction block-config))))

(set blocks.shell
     (fn [block-config cmd bar direction]
       (let [content (shell-command cmd)
             width (if block-config.auto-fit
                     (text-to-width content block-config.margin-x)
                     block-config.width)
             height (if block-config.auto-fit
                     (text-to-height content block-config.margin)
                     block-config.height)]
         (bar-print bar content width height direction block-config))))

(set blocks.memory 
     (partial 
       blocks.shell 
       config.block.memory 
       "free | awk '/^Mem/ { printf(\"RAM %.0f%\", $3/$2 * 100.0) }'"))

(set blocks.window-title
     (partial 
       blocks.shell 
       config.block.window-title
       "xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x \" \\$0\\\\n\" _NET_ACTIVE_WINDOW | awk \"{print \\$2}\") WM_NAME | cut -f2 -d '='"))

(set blocks.free-disk-space
     (partial 
       blocks.shell 
       config.block.free-disk-space
       "df -h /dev/nvme0n1p2 | tail -n 1 |  awk '{print $4}'"))

(set blocks.i3-binding-state
     (fn [bar direction]
       (let [block-config config.block.i3-workspaces
             i3-bs (shell-command "i3-msg --socket $(i3 --get-socketpath) --type GET_BINDING_STATE | jq '.name'")
             content (if (= i3-bs "default") "" i3-bs)
             width (if block-config.auto-fit
                     (text-to-width content block-config.margin-x)
                     block-config.width)
             height (if block-config.auto-fit
                      (text-to-height content block-config.margin)
                      block-config.height)]
       (bar-print bar content width height direction block-config))))

blocks
