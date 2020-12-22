(defun adjust-fill-width (frame)
  ;; "Set fill-column to the min of 110 and window-width"
  (setq fill-column (min 110 (window-width)))
  )

(add-hook 'window-size-change-functions 'adjust-fill-width)
