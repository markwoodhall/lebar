(local renderer {})
(local config (require "config.fnl"))

(fn render-block [bar block direction] 
  (block bar direction))

(set renderer.render-bar
     (fn [bar] 
       (var l-bar bar)
       (set l-bar.renderable-width-right (- (. l-bar :width) config.window.margin))
       (set l-bar.renderable-width-left config.window.margin)
       (each [_ value (pairs (. config.blocks :left))]
         (set l-bar (render-block l-bar value :left)))
       (each [_ value (pairs (. config.blocks :right))]
         (set l-bar (render-block l-bar value :right)))
       l-bar))

renderer
