(require "love.timer")
(var last-result "")
(while true
  (let [file (io.popen "xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x \" \\$0\\\\n\" _NET_ACTIVE_WINDOW | awk \"{print \\$2}\") WM_NAME | cut -f2 -d '='")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel "window-title")
        result (if result
                 (-> result
                     (string.sub 1 45)
                     (string.gsub "\"" "")
                     (string.gsub "^%s*(.-)%s*$" "%1"))
                 "")]
    (when file
      (file:close))
    (when (not= last-result result)
      (channel:push 
        result)
      (draw-channel:supply true))
    (set last-result result)
    (love.timer.sleep 0.6)))
