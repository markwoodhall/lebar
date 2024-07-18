(require "love.timer")
(var last-result "")
(while true
  (os.execute "xprop -id $(xprop -root -f _NET_ACTIVE_WINDOW 0x \" \\$0\\\\n\" _NET_ACTIVE_WINDOW | awk \"{print \\$2}\") WM_NAME | cut -f2 -d '=' > lebar-xwindow")
  (let [file (io.open "lebar-xwindow" "r")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel "window-title")
        result (if result
                 (-> result
                     (string.gsub "\"" "")
                     (string.gsub "^%s*(.-)%s*$" "%1"))
                 "")]
    (when (not= last-result result)
      (channel:push 
        result)
      (draw-channel:push true))
    (set last-result result)
    (love.timer.sleep 0.6)))
