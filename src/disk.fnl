(require "love.timer")
(var last-result "")
(while true
  (let [file (io.popen "df -h blocks.config.block.free-disk-space.mount | tail -n 1 |  awk '{print $4}'")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel (.. "blocks.config.block.free-disk-space.mount.disk"))
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
