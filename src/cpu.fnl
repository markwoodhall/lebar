(require "love.timer")
(while true
  (os.execute "{ head -n1 /proc/stat;sleep 5.0;head -n1 /proc/stat; } | awk '/^cpu /{u=$2-u;s=$4-s;i=$5-i;w=$6-w}END{print int(0.5+100*(u+s+w)/(u+s+i+w))}' > lebar-cpu")
  (let [file (io.open "lebar-cpu" "r")
        result (file:read "*a")
        channel (love.thread.getChannel "cpu")]
    (channel:push 
      (if result
        (-> result
            (string.gsub "\"" "")
            (string.gsub "^%s*(.-)%s*$" "%1"))
        ""))
    (love.timer.sleep 5)))
