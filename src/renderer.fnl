(local renderer {})
(local config (require "config.fnl"))

(fn render-block [bar block direction cfg]
  (local (ok result) (pcall (fn [] (block bar direction cfg))))
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
           (set l-bar (render-block l-bar (. value :load) :left config))))
       (each [_ value (pairs (. config.blocks :right))]
         (when (not= (type value) "function")
           (set l-bar (render-block l-bar (. value :load) :right config))))
       l-bar))

(set renderer.render-bar
     (fn [bar] 
       (var l-bar bar)
       (set l-bar.renderable-width-right (- (. l-bar :width) config.window.margin config.window.margin))
       (set l-bar.renderable-width-left config.window.margin)
       (each [_ value (pairs (. config.blocks :left))]
         (if (= (type value) "function")
           (set l-bar (render-block l-bar value :left config))
           (set l-bar (render-block l-bar (. value :draw) :left config))))
       (each [_ value (pairs (. config.blocks :right))]
         (if (= (type value) "function")
           (set l-bar (render-block l-bar value :right config))
           (set l-bar (render-block l-bar (. value :draw) :right config))))
       l-bar))

renderer
