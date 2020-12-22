; Temporary workaround
(setq warning-minimum-level :emergency)

(setq cask-path (concat "/home/" (user-login-name) "/.cask/cask.el"))

(require `cask cask-path)
(cask-initialize)

(require 'pallet)
(pallet-mode t)

;; inhibit-startup-echo-area-message MUST be set to a hardcoded
;; string of your login name
(setq inhibit-startup-echo-area-message (user-login-name))
(setq inhibit-startup-message t)

;; Package config files

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "emacs-general")
;; (load-library "misc")
;; (load-library "dashboard-conf")
(load-library "yasnippet-conf")
(load-library "neotree-conf")
(load-library "evil-mode-conf")
(load-library "ibuffer-conf")
(load-library "helm-conf")
(load-library "org-mode-conf")
(load-library "markdown-mode-conf")
;; (load-library "auctex-conf")
(load-library "magit-conf")
;; (load-library "python-mode-conf")
(load-library "smartparens-conf")
(load-library "simple-rust-mode-conf")
;; (load-library "rust-mode-conf")
;; (load-library "fzf-conf")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("bae098b53639a4478089251b6a1c8fcb86e5f6ba41ac3d6b79c0ce54812b8a90" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(ein:polymode t)
 '(fci-rule-color "#3C3D37")
 '(fill-column 110)
 '(flycheck-check-syntax-automatically (quote (save idle-change mode-enabled)))
 '(flycheck-idle-change-delay 2)
 '(helm-ff-keep-cached-candidates (quote nil))
 '(help-window-select t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(org-M-RET-may-split-line (quote ((default))))
 '(org-default-notes-file (concat org-directory "/notes.org"))
 '(org-directory "~/OrgMode")
 '(org-export-html-postamble nil)
 '(org-hide-leading-stars t)
 '(org-noter-auto-save-last-location t)
 '(org-noter-notes-search-path (quote ("~/OrgMode/math/")))
 '(org-startup-folded (quote overview))
 '(org-startup-indented t)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (f dashboard nix-mode all-the-icons elpy rust-mode magit yasnippet helm markdown-mode tex use-package neotree monokai-theme evil-nerd-commenter evil-leader auctex-latexmk)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(safe-local-variable-values (quote ((reftex-default-bibliography "references.bib"))))
 '(save-place-mode t)
 '(show-paren-mode t)
 '(smooth-scrolling-mode t)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :height 120 :family "DejaVu Sans Mono")))))
(put 'narrow-to-region 'disabled nil)
