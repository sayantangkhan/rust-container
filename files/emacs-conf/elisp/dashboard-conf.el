;; Dashboard configuration
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
  (setq dashboard-startup-banner 'logo)
  (setq show-week-agenda-p t)
  (setq time-string-formatting "%e %b ")
  (setq dashboard-items '(
			  (agenda . 10)
			  (bookmarks . 10)
			  ;; (recents  . 10)
			  )
	)
  ;; Content is not centered by default. To center, set
  (setq dashboard-center-content t)
  (add-hook 'dashboard-mode-hook
	    (lambda ()
	      (local-set-key (kbd "o") 'org-capture)
	      )
	    )
  (add-hook 'dashboard-mode-hook
	    (lambda ()
	      (local-set-key (kbd "p") 'org-agenda)
	      )
	    )
  (setq dashboard-set-footer nil)
  )
