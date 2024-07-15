(local blocks {})
(local config {})


; default configuration for blocks
(set config.block {})
(set config.block.defaults {})
(set config.block.defaults.margin 2)
(set config.block.defaults.margin-x 8)
(set config.block.defaults.width 140)
(set config.block.defaults.auto-fit true)

(set config.block.defaults.foreground-color
     [0.6470588235294118 0.6784313725490196 0.796078431372549 1])

; configuration for the separator block
(set config.block.separator {})
(set config.block.separator.margin config.block.defaults.margin)
(set config.block.separator.margin-x config.block.defaults.margin-x)
(set config.block.separator.width 28)
(set config.block.separator.text "|")
(set config.block.separator.foreground-color config.block.defaults.foreground-color)
(set config.block.separator.auto-fit config.block.defaults.auto-fit)

; configuration for the time block
(set config.block.time {})
(set config.block.time.margin config.block.defaults.margin)
(set config.block.time.margin-x config.block.defaults.margin-x)
(set config.block.time.width 100)
(set config.block.time.format "%H:%M")
(set config.block.time.foreground-color [0.6196078431372549 0.1607843137254902 0.1607843137254902])
(set config.block.time.auto-fit config.block.defaults.auto-fit)

; configuration for the power block
(set config.block.power {})
(set config.block.power.width config.block.defaults.width)
(set config.block.power.margin config.block.defaults.margin)
(set config.block.power.margin-x config.block.defaults.margin-x)
(set config.block.power.foreground-color config.block.defaults.foreground-color)
(set config.block.power.auto-fit config.block.defaults.auto-fit)

; configuration for the shell block
(set config.block.shell {})
(set config.block.shell.width config.block.defaults.width)
(set config.block.shell.margin config.block.defaults.margin)
(set config.block.shell.margin-x config.block.defaults.margin-x)
(set config.block.shell.foreground-color config.block.defaults.foreground-color)
(set config.block.shell.auto-fit config.block.defaults.auto-fit)

(fn text-to-width [text margin]
  "Given some text to be rendered, try to calculate an appropriate width for the block"
  (let [font (love.graphics.getFont)
        width (font:getWidth text)]
    (+ width margin)))

(fn bar-print [bar content width direction block-config]
  (love.graphics.setColor block-config.foreground-color)
  (let [renderable-width-right (. bar :renderable-width-right)
        renderable-width-left (. bar :renderable-width-left)]
    (case direction
      :right (do 
               (love.graphics.print 
                 content
                 (- renderable-width-right width) 
                 block-config.margin)
               (set bar.renderable-width-right (- renderable-width-right width)))
      :left (do 
              (love.graphics.print
                content
                renderable-width-left
                block-config.margin)
              (set bar.renderable-width-left (+ renderable-width-left width))))
    bar))

(set blocks.separator
     (fn [bar direction]
       (let [content config.block.separator.text
             width (if config.block.separator.auto-fit
               (text-to-width content config.block.separator.margin-x)
               config.block.separator.width)]
         (bar-print bar content width direction config.block.separator))))

(set blocks.time 
     (fn [bar direction]
       (let [time (os.date config.block.time.format)
             content time
             width (if config.block.time.auto-fit
               (text-to-width content config.block.time.margin-x)
               config.block.time.width)]
         (bar-print bar content width direction config.block.time))))

(set blocks.power
     (fn [bar direction]
       (local (state percent) (love.system.getPowerInfo))
       (let [content (.. state (if percent (.. " " percent) ""))
             width (if config.block.power.auto-fit
                     (text-to-width content config.block.power.margin-x)
                     config.block.power.width)]
         (bar-print bar content width direction config.block.power))))

(fn shell-command [command]
  (let [handle (io.popen command)
        result (handle:read "*l")]
    (handle:close)
    (if result
    (-> result
        (string.gsub "\"" "")
        (string.gsub "^%s*(.-)%s*$" "%1"))
      "")))

(set blocks.shell
     (fn [cmd bar direction]
       (let [content (shell-command cmd)
             width (if config.block.shell.auto-fit
                     (text-to-width content config.block.shell.margin-x)
                     config.block.shell.width)]
         (bar-print bar content width direction config.block.shell))))

(set blocks.memory 
     (partial blocks.shell "free | awk '/^Mem/ { printf(\"RAM %.0f%\", $3/$2 * 100.0) }'"))

(set blocks.cpu
     (partial blocks.shell "cat /proc/stat |  awk '/^cpu / { printf(\"CPU %.0f%\", ($2+$4)*100/($2+$4+$5)) }'"))

(set blocks.window-title
     (partial blocks.shell "xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x \" \\$0\\\\n\" _NET_ACTIVE_WINDOW | awk \"{print \\$2}\") WM_NAME | cut -f2 -d '='"))

(set blocks.i3-workspace
     (partial blocks.shell "i3-msg -s $(i3 --get-socketpath) -t get_workspaces | jq -r '.[] | select(.focused==true) | .name'"))

(set blocks.free-disk-space
     (partial blocks.shell "df -h /dev/nvme0n1p2 | tail -n 1 |  awk '{print $4}'"))

(set blocks.i3-binding-state
     (partial blocks.shell "i3-msg --socket $(i3 --get-socketpath) --type GET_BINDING_STATE | jq '.name'"))

blocks
