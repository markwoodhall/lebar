(local renderer {})
(local config (require "config.fnl"))

(fn render-block [bar block direction] 
  (local (ok result) (pcall (fn [] (block bar direction))))
  (if ok
    result
    (do
      (print (.. "Error rendering block: " result))
      bar)))

(set renderer.load-bar
     (fn [bar] 
       (var l-bar bar)
       (each [_ value (pairs (. config.blocks :left))]
         (when (not= (type value) "function")
           (set l-bar (render-block l-bar (. value :load) :left))))
       (each [_ value (pairs (. config.blocks :right))]
         (when (not= (type value) "function")
           (set l-bar (render-block l-bar (. value :load) :right))))
       l-bar))

(set renderer.render-bar
     (fn [bar] 
       (var l-bar bar)
       (set l-bar.renderable-width-right (- (. l-bar :width) config.window.margin config.window.margin))
       (set l-bar.renderable-width-left config.window.margin)
       (each [_ value (pairs (. config.blocks :left))]
         (if (= (type value) "function")
           (set l-bar (render-block l-bar value :left))
           (set l-bar (render-block l-bar (. value :draw) :left))))
       (each [_ value (pairs (. config.blocks :right))]
         (if (= (type value) "function")
           (set l-bar (render-block l-bar value :right))
           (set l-bar (render-block l-bar (. value :draw) :right))))
       l-bar))

renderer
