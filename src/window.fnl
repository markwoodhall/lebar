(local window {})

(fn margins [x y width height margin-x margin-y]
  {:width (- width (* 2 margin-x))
   :height height
   :x (+ x margin-x)
   :y (+ y margin-y)})

(fn w-top [width height margin-x margin-y] 
  (let [coords (margins 0 0 width height margin-x margin-y)
        width (. coords :width)
        height (. coords :height)
        x (. coords :x)
        y (. coords :y)]
    (love.window.setMode 
      width 
      height 
      {:resizable false 
       :fullscreen false 
       :minwidth width
       :minheight height
       :centered false
       :borderless true
       :vsync false})
    (love.window.setPosition x y)
    {:width width
     :height height
     :renderable-width-right width
     :renderable-width-left width
     :x x
     :y y}))

(set window.place-window 
     (fn [config]
       "Places the love window (bar) based on the config"
       (local (width height) (love.window.getDesktopDimensions))
       (love.window.setTitle "LEBAR_WM_TB")
       (case config.position
         :top (w-top 
                width
                config.height
                config.margin
                config.margin)
         :bottom (w-top 
                   width
                   config.height
                   config.margin
                   (- height config.height config.margin))
         _ (w-top 
             width
             config.height
             config.margin
             config.margin))))

window
