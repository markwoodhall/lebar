(require "love.timer")
(var last-result "")
(while true
  (let [file (io.popen "free | awk '/^Mem/ { printf(\"%.0f%\", $3/$2 * 100.0) }'")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel "memory")
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
    (love.timer.sleep 30)))
