(local blocks {})

(fn text-to-width [block-config text]
  "Given some text to be rendered, try to calculate an appropriate width for the block"
  (let [font block-config.love-font
        width (font:getWidth text)]
    width))

(fn text-to-height [block-config text]
  "Given some text to be rendered, try to calculate an appropriate height for the block"
  (let [font block-config.love-font
        height (font:getHeight text)]
    height))

(fn print-left [bar block-config renderable-width width height content]
  (let [[top right bottom left] block-config.border]
    (love.graphics.setColor block-config.border-color)
    (love.graphics.rectangle 
      "fill" 
      renderable-width 
      block-config.margin 
      (+ block-config.padding-x 
         block-config.padding-x 
         width left right) 
      (+ (/ block-config.radius 2) height top)
      0
      0)
    (love.graphics.setColor block-config.background-color)
    (love.graphics.rectangle 
      "fill" 
      (+ renderable-width left) 
      (+ block-config.margin top ) 
      (- (+ block-config.padding-x 
            block-config.padding-x 
            width) left right) 
      (- (+ (/ block-config.radius 2) height) bottom)
      block-config.radius 
      block-config.radius))
  (love.graphics.setColor block-config.foreground-color)
  (love.graphics.print 
    content
    (+ renderable-width block-config.padding-x) 
    block-config.margin)
  (set bar.renderable-width-left 
       (+ renderable-width 
          (+ block-config.padding-x 
             block-config.padding-x 
             width))))

(fn print-right [bar block-config renderable-width width height content]
  (let [[top right bottom left] block-config.border]
    (love.graphics.setColor block-config.border-color)
    (love.graphics.rectangle 
      "fill" 
      (- renderable-width 
         width 
         block-config.padding-x)
      block-config.margin 
      (+ block-config.padding-x 
         block-config.padding-x 
         width left right) 
      (+ (/ block-config.radius 2) height top)
      0
      0)
    (love.graphics.setColor block-config.background-color)
    (love.graphics.rectangle 
      "fill" 
      (+ (- renderable-width 
         width 
         block-config.padding-x) left) 
      (+ block-config.margin top) 
      (+ block-config.padding-x 
         block-config.padding-x 
         width) 
      (- (+ (/ block-config.radius 2) height) bottom)
      block-config.radius
      block-config.radius))
  (love.graphics.setColor block-config.foreground-color)
  (love.graphics.print 
    content
    (- renderable-width width) 
    block-config.margin)
  (set bar.renderable-width-right 
       (- renderable-width 
          (+ block-config.padding-x 
             block-config.padding-x 
             width))))

(fn bar-print [bar content width height direction block-config]
  (let [renderable-width-right (. bar :renderable-width-right)
        renderable-width-left (. bar :renderable-width-left)]
    (love.graphics.setFont block-config.love-font)
    (case direction
      :right (print-right bar block-config renderable-width-right width height content)
      :left (print-left bar block-config renderable-width-left width height content))
    (love.graphics.setFont block-config.love-font)
    bar))

(set blocks.separator
     (fn [bar direction config]
       (let [block-config config.block.separator
             content block-config.text
             width (if block-config.auto-fit
                     (text-to-width block-config content)
                     block-config.width)
             height (if block-config.auto-fit
                      (text-to-height block-config content)
                      block-config.height)]
         (bar-print bar content width height direction block-config))))

(var blocks-state-time {})
(set blocks.time
     {:load
      (fn [bar _direction config]
        (local time (love.filesystem.read "time.fnl"))
        (local (parsed _) (string.gsub time "blocks.config.block.time.format" config.block.time.format))
        (local luas (fennel.compile-string parsed))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.time
              channel (love.thread.getChannel "time")]
          (if (channel:peek)
            (let [time (channel:pop)
                  content (.. " " time)
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (when time
                (set blocks-state-time {:time time :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-time.content
              (bar-print bar blocks-state-time.content blocks-state-time.width blocks-state-time.height direction block-config)
              bar))))})

(fn expand-bar [col bar direction block-config content-fn config-fn config]
  (accumulate [b bar
               _ n (ipairs col)]
    (let [content (content-fn n)
          width (if block-config.auto-fit
                  (text-to-width block-config content)
                  block-config.width)
          height (if block-config.auto-fit
                   (text-to-height block-config content)
                   block-config.height)]
      (config-fn n block-config)
      (let [new-bar (bar-print b content width height direction block-config)]
        (blocks.separator new-bar direction config)))))

(var blocks-state-wmctrl {})
(set blocks.wmctrl
     {:load
      (fn [bar _direction _config]
        (local i3 (love.filesystem.read "wmctrl.fnl"))
        (local luas (fennel.compile-string i3))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [channel (love.thread.getChannel "wmctrl")
              content-fn (fn [i] (. i :name))
              block-config config.block.wmctrl
              config-fn 
              (fn [i block-config] 
                (let [focused (. i :focused)]
                  (if focused
                    (do
                      (set block-config.foreground-color config.theme.gray)
                      (set block-config.background-color config.theme.black)
                      (set block-config.border-color config.theme.green))
                    (do
                      (set block-config.foreground-color config.theme.gray)
                      (set block-config.background-color config.theme.black)
                      (set block-config.border-color config.theme.black)))))]
          (set block-config.foreground-color config.theme.gray)
          (set block-config.background-color config.theme.black)
          (if (channel:peek)
            (let [ws (channel:pop)
                  workspaces (icollect [v (ws:gmatch "[^,]+")]
                               (let [t (v:gmatch "[^%s%s]+")]
                                 {:name (+ (or (tonumber (t)) 0) 1) :focused (= (t) "*")}))]
              (when ws
                (set blocks-state-wmctrl {:wmctrl ws :workspaces workspaces}))
              (expand-bar workspaces bar direction block-config content-fn config-fn config))
            (if blocks-state-wmctrl.workspaces
              (expand-bar blocks-state-wmctrl.workspaces bar direction block-config content-fn config-fn config)
              bar))))})

(var blocks-state-i3-workspace {})
(set blocks.i3-workspace
     {:load
      (fn [bar _direction _config]
        (local i3 (love.filesystem.read "i3.fnl"))
        (local luas (fennel.compile-string i3))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [channel (love.thread.getChannel "i3ws")
              content-fn (fn [i] (. i :name))
              block-config config.block.i3-workspace
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
          (set block-config.foreground-color config.theme.black)
          (set block-config.background-color config.theme.green)
          (if (channel:peek)
            (let [ws (channel:pop)
                  workspaces (icollect [v (ws:gmatch "[^,]+")]
                               (let [t (v:gmatch "[^%-]+")]
                                 {:name (t) :focused (= (t) "true")}))]
              (when ws
                (set blocks-state-i3-workspace {:i3-workspace ws :workspaces workspaces}))
              (expand-bar workspaces bar direction block-config content-fn config-fn config))
            (if blocks-state-i3-workspace.workspaces
              (expand-bar blocks-state-i3-workspace.workspaces bar direction block-config content-fn config-fn config)
              bar))))})

(var blocks-state-i3-binding-state {})
(set blocks.i3-binding-state
     {:load
      (fn [bar _direction config]
        (set config.block.i3-binding-state.og-background-color config.block.i3-binding-state.background-color)
        (set config.block.i3-binding-state.og-foreground-color config.block.i3-binding-state.foreground-color)
        bar)
      :draw 
      (fn [bar direction config]
        (let [channel (love.thread.getChannel "i3bs")
              block-config config.block.i3-binding-state
              original-bg config.block.i3-binding-state.og-background-color
              original-fg config.block.i3-binding-state.og-foreground-color]
          (if (channel:peek)
            (let [ws (channel:pop)
                  content (.. block-config.label ws)
                  width (if block-config.auto-fit
                            (text-to-width block-config content)
                            block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height config.block.i3-binding-state content config.block.i3-binding-state.margin)
                           config.block.i3-binding-state.height)]
              (when ws
                (set blocks-state-i3-binding-state {:i3-binding-state ws :content content :width width :height height}))
              (set block-config.foreground-color original-fg)
              (set block-config.background-color original-bg)
              (bar-print bar content width height direction block-config))
            (if blocks-state-i3-binding-state.content
              (let [fg block-config.foreground-color
                    bg block-config.background-color]
                (if (not= blocks-state-i3-binding-state.i3-binding-state "default")
                  (do 
                    (set block-config.foreground-color bg)
                    (set block-config.background-color fg))
                  (do 
                    (set block-config.foreground-color original-fg)
                    (set block-config.background-color original-bg)))
                (bar-print bar blocks-state-i3-binding-state.content blocks-state-i3-binding-state.width blocks-state-i3-binding-state.height direction block-config))
              (do 
                (set block-config.foreground-color original-fg)
                (set block-config.background-color original-bg)
                bar)))))})

(var blocks-state-dunst {})
(set blocks.dunst
     {:load
      (fn [bar _direction _config]
        (local dunst (love.filesystem.read "dunst.fnl"))
        (local luas (fennel.compile-string dunst))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.dunst
              channel (love.thread.getChannel "dunst")]
          (if (channel:peek)
            (let [
                  channel (love.thread.getChannel "dunst")
                  dunst (channel:pop)
                  content (.. block-config.label dunst)
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (when dunst
                (set blocks-state-dunst {:dunst dunst :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-dunst.content
              (bar-print bar blocks-state-dunst.content blocks-state-dunst.width blocks-state-dunst.height direction block-config)
              bar))))})

(var blocks-state-memory {})
(set blocks.memory
     {:load
      (fn [bar _direction _config]
        (local memory (love.filesystem.read "memory.fnl"))
        (local luas (fennel.compile-string memory))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [channel (love.thread.getChannel "memory")
              block-config config.block.memory]
          (if (channel:peek)
            (let [channel (love.thread.getChannel "memory")
                  memory (channel:pop)
                  content (.. block-config.label memory)
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (when memory
                (set blocks-state-memory {:memory memory :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-memory.content
              (bar-print bar blocks-state-memory.content blocks-state-memory.width blocks-state-memory.height direction block-config)
              bar))))})

(var blocks-state-user {})
(set blocks.user
     {:load
      (fn [bar _direction _config]
        (local user (love.filesystem.read "user.fnl"))
        (local luas (fennel.compile-string user))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.user 
              channel (love.thread.getChannel "user")]
          (if (channel:peek)
            (let [channel (love.thread.getChannel "user")
                  user (channel:pop)
                  content (.. block-config.label user)
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (when user
                (set blocks-state-user {:user user :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-user.content
              (bar-print bar blocks-state-user.content blocks-state-user.width blocks-state-user.height direction block-config)
              bar))))})

(var blocks-state-power {})
(set blocks.power
     {:load
      (fn [bar _direction _config]
        (local power (love.filesystem.read "power.fnl"))
        (local luas (fennel.compile-string power))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.power
              channel (love.thread.getChannel "power")]
          (if (channel:peek)
            (let [power (channel:pop)
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
                  remaining (if (and block-config.include-remaining-time 
                                     (not= state "charging")
                                     (not= state "nobattery")) 
                              (.. " " (string.format "%.2f" hours) "(h)")
                              "")
                  content (if hours (.. content  remaining) content)
                  width (if config.block.power.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if config.block.power.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
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
              (bar-print bar blocks-state-power.content blocks-state-power.width blocks-state-power.height direction block-config)
              bar))))})

(var blocks-state-pacman {})
(set blocks.pacman
     {:load
      (fn [bar _direction _config]
        (local pacman (love.filesystem.read "pacman.fnl"))
        (local luas (fennel.compile-string pacman))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.pacman
              channel (love.thread.getChannel "pacman")]
          (if (channel:peek)
            (let [pacman (channel:pop)
                  content (.. block-config.label (..  pacman " update(s)"))
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (case (tonumber pacman)
                (where p (<= p 50)) (set block-config.foreground-color config.theme.green)
                (where p (<= p 100)) (set block-config.foreground-color config.theme.yellow)
                (where p (> p 100)) (set block-config.foreground-color config.theme.red))
              (when pacman
                (set blocks-state-pacman {:pacman pacman :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-pacman.content
              (bar-print bar blocks-state-pacman.content blocks-state-pacman.width blocks-state-pacman.height direction block-config)
              bar))))})

(fn thread-shell-command [command]
  (: (love.thread.newThread (tostring command)) :start))

(set blocks.thread-shell-command thread-shell-command)

(var blocks-state-cpu-last 0)
(set blocks.cpu
     {:load
      (fn [bar _direction _config]
        (local cpu (love.filesystem.read "cpu.fnl"))
        (local luas (fennel.compile-string cpu))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.cpu 
              channel (love.thread.getChannel "cpu")
              cpu-percentage (channel:pop)
              content (.. block-config.label (or cpu-percentage blocks-state-cpu-last) "%")
              width (if block-config.auto-fit
                      (text-to-width block-config content)
                      block-config.width)
              height (if block-config.auto-fit
                       (text-to-height block-config content)
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
      (fn [bar _direction _config]
        (local window-title (love.filesystem.read "xwindow.fnl"))
        (local luas (fennel.compile-string window-title))
        (blocks.thread-shell-command luas)
        bar)
      :draw 
      (fn [bar direction config]
        (let [block-config config.block.window-title
              channel (love.thread.getChannel "window-title")]
          (if (channel:peek)
            (let [window-title (channel:pop)
                  content (.. window-title)
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (when window-title
                (set blocks-state-window-title {:window-title window-title :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if blocks-state-window-title.content
              (bar-print bar blocks-state-window-title.content blocks-state-window-title.width blocks-state-window-title.height direction block-config)
              bar))))})

(var blocks-state-free-disk-space {})
;; Setting here to supress fennel-ls warning
(set blocks-state-free-disk-space {})
(set blocks.free-disk-space
     {:load
      (fn [mount id bar _direction _config]
        (local free-disk-space (love.filesystem.read "disk.fnl"))
        (local (with-id _) (string.gsub free-disk-space "blocks%.config%.block%.free%-disk%-space%.id" id))
        (local (with-mount _) (string.gsub with-id "blocks%.config%.block%.free%-disk%-space%.mount" mount))
        (local luas (fennel.compile-string with-mount))
        (blocks.thread-shell-command luas)
        (tset blocks-state-free-disk-space id {})
        bar)
      :draw 
      (fn [mount id label bar direction config]
        (let [block-config config.block.free-disk-space 
              channel (love.thread.getChannel (.. mount ".disk"))]
          (if (channel:peek)
            (let [free-disk-space (channel:pop)
                  content (.. (if label label block-config.label) free-disk-space)
                  width (if block-config.auto-fit
                          (text-to-width block-config content)
                          block-config.width)
                  height (if block-config.auto-fit
                           (text-to-height block-config content)
                           block-config.height)]
              (when free-disk-space
                (tset blocks-state-free-disk-space id {:free-disk-space free-disk-space :content content :width width :height height}))
              (bar-print bar content width height direction block-config))
            (if (. (. blocks-state-free-disk-space id) :content)
              (let [state (. blocks-state-free-disk-space id)]
                (bar-print bar state.content state.width state.height direction block-config))
              bar))))})

blocks
