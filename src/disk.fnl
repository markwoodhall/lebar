(require "love.timer")
(var last-result "")
(while true
  (os.execute "df -h /dev/nvme0n1p2 | tail -n 1 |  awk '{print $4}' > lebar-disk")
  (let [file (io.open "lebar-disk" "r")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel "disk")
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
    (love.timer.sleep 90)))
