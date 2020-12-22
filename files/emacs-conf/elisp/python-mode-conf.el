;; Python mode conf
(use-package elpy
  :init
  (elpy-enable))

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython3"
	python-shell-interpreter-args "-i --simple-prompt"))

;; Enable Flycheck
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode)
;;   )
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


(add-hook 'python-mode-hook 'blacken-mode)
;; (local-set-key (kbd "M-S-return") 'ein:worksheet-execute-cell-and-goto-next)

;; (use-package python-mode
  ;; :bind ("M-S-RET" . ein:worksheet-execute-cell-and-goto-next))
