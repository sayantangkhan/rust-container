(require 'rust-mode)

(with-eval-after-load 'rust-mode
	(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-to-list 'exec-path "~/.cargo/bin")
(add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(require 'separedit)

;; Key binding for modes you want edit
;; or simply bind ‘global-map’ for all.
(define-key rust-mode-map        (kbd "C-c '") #'separedit)

;; Default major-mode for edit buffer
;; can also be other mode e.g. ‘org-mode’.
(setq separedit-default-mode 'markdown-mode)
