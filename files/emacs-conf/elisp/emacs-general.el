;; General emacs options


;; Backup files
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

;; Shorten yes no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; Disabling the menu bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Revert buffer without confirmation
(defun revert-buffer-no-confirm ()
      "Revert buffer without confirmation."
      (interactive) (revert-buffer t t))
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

;; Setting up smooth scrolling
(setq scroll-conservatively 4)
(setq scroll-margin 2)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; Setting up history
(savehist-mode 1)
;; Cursor color

(require 'frame)
(defun set-cursor-hook (frame)
(modify-frame-parameters
  frame (list (cons 'cursor-color "White"))))

(add-hook 'after-make-frame-functions 'set-cursor-hook)

;; Remember position in file
(save-place-mode 1)

;; Clean up whitespace before save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Moving between panes
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;; Custom themes
(use-package monokai-theme
 :config
 (load-theme 'monokai t)
)

;; Replace ding bell with visual alarm
(setq visible-bell 1)

;; Set proper frame title
(setq-default frame-title-format '("%b [%m]"))
