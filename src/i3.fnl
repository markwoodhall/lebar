(require "love.timer")
(var last-result-i3ws "")
(var last-result-i3bs "")

(fn process [file channel last-result complete] 
  (let [file (io.popen file)
        result (if file (file:read "*a") last-result)
        draw-channel (love.thread.getChannel "draw")
        channel (love.thread.getChannel channel)
        result (if result
                 (-> result
                     (string.gsub "\"" "")
                     (string.gsub "^%s*(.-)%s*$" "%1"))
                 "")]
    (when file
      (file:close))
    (when (or (not= last-result result))
      (channel:push 
        result)
      (draw-channel:supply true))
    (complete result draw-channel)))

(while true
  (process "i3-msg -s $(i3 --get-socketpath) -t get_workspaces | jq -r '.[] | (.name + \"-\" + (.focused|tostring))'  | paste -sd ','" "i3ws" last-result-i3ws (fn [result _] (set last-result-i3ws result)))
  (process "i3-msg --socket $(i3 --get-socketpath) --type GET_BINDING_STATE | jq '.name'" "i3bs" last-result-i3bs (fn [result draw-channel] (set last-result-i3bs result) (when (not= result "default") (draw-channel:supply true))))
  (love.timer.sleep 0.5))
