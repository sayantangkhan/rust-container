;; Configuration of evil and related packages

(use-package evil
  :config
  (global-evil-leader-mode)
  (evil-mode 1)
  (add-to-list 'evil-emacs-state-modes 'neotree-mode)
  (add-to-list 'evil-emacs-state-modes 'dashboard-mode)
  (evil-set-initial-state 'inferior-python-mode 'emacs)
  )

(use-package evil-nerd-commenter
  :config
  (evilnc-default-hotkeys)
  )

(use-package evil-leader
  :config
  (evil-leader/set-key
    "b" 'switch-to-buffer
    "'" 'ibuffer
    "k" 'kill-buffer
    "c" 'evilnc-comment-or-uncomment-lines)
  )
