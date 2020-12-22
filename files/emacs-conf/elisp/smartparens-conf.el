(use-package smartparens-config)

;; Hooks for various major modes
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'org-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-smartparens-strict-mode)
