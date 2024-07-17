(require "love.timer")
(while true
  (os.execute "free | awk '/^Mem/ { printf(\"RAM %.0f%\", $3/$2 * 100.0) }' > lebar-memory")
  (let [file (io.open "lebar-memory" "r")
        result (file:read "*a")
        channel (love.thread.getChannel "memory")]
    (channel:push 
      (if result
        (-> result
            (string.gsub "\"" "")
            (string.gsub "^%s*(.-)%s*$" "%1"))
        ""))
    (love.timer.sleep 30)))
