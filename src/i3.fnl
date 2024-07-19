(require "love.timer")
(var last-result-i3ws "")
(var last-result-i3bs "")

(fn process [file channel last-result complete] 
  (let [file (io.open file "r")
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel channel)
        result (if result
                 (-> result
                     (string.gsub "\"" "")
                     (string.gsub "^%s*(.-)%s*$" "%1"))
                 "")]
    (print (channel:getCount))
    (when (not= last-result result)
      (channel:clear)
      (channel:push 
        result)
      (draw-channel:supply true))
    (complete result)))

(while true
  (os.execute "i3-msg -s $(i3 --get-socketpath) -t get_workspaces | jq -r '.[] | (.name + \"-\" + (.focused|tostring))'  | paste -sd ',' > lebar-i3ws")
  (os.execute "i3-msg --socket $(i3 --get-socketpath) --type GET_BINDING_STATE | jq '.name' > lebar-i3bs")
  (process "lebar-i3ws" "i3ws" last-result-i3ws (fn [result] (set last-result-i3ws result)))
  (process "lebar-i3bs" "i3bs" last-result-i3bs (fn [result] (set last-result-i3bs result)))
  (love.timer.sleep 0.5))
