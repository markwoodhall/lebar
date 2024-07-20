(require "love.timer")
(var last-result "")
(while true
  (os.execute "echo \"$(whoami)@$(cat /etc/hostname)\" > lebar-user")
  (let [file (io.open "lebar-user" "r")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel "user")
        result (if result
                 (-> result
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
    (love.timer.sleep 90000)))
