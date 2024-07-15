(local window {})

(fn margins [x y width height margin]
  {:width (- width (* 2 margin))
   :height height
   :x (+ x margin)
   :y (+ y margin)})

(fn w-top [width height margin] 
  (let [coords (margins 0 0 width height margin)
        width (. coords :width)
        height (. coords :height)
        x (. coords :x)
        y (. coords :y)]
    (love.window.setMode 
      width 
      height 
      {:resizable false 
       :fullscreen false 
       :vsync false})
    (love.window.setPosition x y)
    {:width width
     :height height
     :renderable-width width
     :x x
     :y y}))

(set window.place-window 
     (fn [config]
       "Places the love window (bar) based on the config"
       (case config.position
         :top (w-top 
                (love.window.getDesktopDimensions)
                config.height
                config.margin))))

window
