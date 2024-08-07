

(require "love.timer")
(var last-result "")
(while true
  (let [file (io.popen "dunstctl history | jq '.data[].[] | (.appname.data + \" - \" + .summary.data)' | head -n 1")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel "dunst")
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
    (love.timer.sleep 5)))
