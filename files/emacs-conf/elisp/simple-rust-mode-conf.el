(require 'rust-mode)

(with-eval-after-load 'rust-mode
	(add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-to-list 'exec-path "$HOME/.cargo/bin")
(add-hook 'rust-mode-hook 'flycheck-mode)
(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)
