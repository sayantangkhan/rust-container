;; Setting up Org Mode

(use-package org
  :config
  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.35))

  (add-hook 'org-mode-hook
	    (lambda ()
	      (evil-leader/set-key "i" 'org-insert-heading)
	      )
	    )

  (evil-leader/set-key "p" 'org-agenda)
  (evil-leader/set-key "o" 'org-capture)

  (custom-set-variables
   '(org-directory "~/OrgMode")
   '(org-default-notes-file (concat org-directory "/notes.org"))
   '(org-export-html-postamble nil)
   '(org-hide-leading-stars t)
   '(org-startup-folded (quote overview))
   '(org-startup-indented t)
   )

  (setq org-refile-targets '((nil :maxlevel . 3)
			     (org-agenda-files :maxlevel . 3)))

  (setq org-reverse-note-order t)

  (setq org-agenda-files (list "~/OrgMode/main.org"))

  (setq org-capture-templates
	'(("l" "Link" entry (file+headline "~/OrgMode/links.org" "Uncategorized links")
	   "* %^{PROMPT}\n%^L%?\n%T" :prepend t)
	  ("b" "Blog idea" entry (file+headline "~/OrgMode/main.org" "Blog Topics")
	   "* %? \n%U" :prepend t)
	  ("t" "To Do Item" entry (file+headline "~/OrgMode/main.org" "To Do")
	   "* TODO %? \n%U" :prepend t)
	  ("i" "Item" entry (file+headline "~/OrgMode/main.org" "Uncategorized")
	   "* %? %^G \n%U" :prepend t)
	  ("n" "Note" entry (file+headline "~/OrgMode/notes.org" "Uncategorized notes")
	   "* %? %^G \n%u" :prepend t)
	  ("k" "Keybinding" entry (file+headline "~/OrgMode/keybindings.org" "Uncategorized")
	   "* %^{Description|Description} \n - Keybinding: %^{Keybinding|<undefined>} \n - Interactive function: %^{Function name|unknown} \n %?")
	  ))

  (setq org-todo-keywords
	'((sequence "TODO" "NEXT" "WAITING" "|" "INACTIVE" "CANCELLED" "DONE")))

  (setq org-todo-keyword-faces
	'(
	  ;; ("TODO" . org-warning)
	  ("NEXT" . "yellow")
	  ("WAITING" . "orange")
	  ))

  (defadvice org-capture-finalize
      (after delete-capture-frame activate)
    "Advise capture-finalize to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
	(delete-frame)))

  (defadvice org-capture-destroy
      (after delete-capture-frame activate)
    "Advise capture-destroy to close the frame"
    (if (equal "capture" (frame-parameter nil 'name))
	(delete-frame)))

  ;; Saving all org buffers after common operations
  (advice-add 'org-refile :after
	      (lambda (&rest _)
		(org-save-all-org-buffers)))
  (advice-add 'org-archive-subtree :after #'org-save-all-org-buffers)

  ;; (use-package noflet)
  ;; (defun make-capture-frame ()
  ;;   "Create a new frame and run org-capture."
  ;;   (interactive)
  ;;   (make-frame '((name . "capture")))
  ;;   (select-frame-by-name "capture")
  ;;   (delete-other-windows)
  ;;   (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
  ;;           (org-capture)))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     ;; (bash . t)
     ))

  (setq org-src-fontify-natively t)

  (setq linum-format "%4d \u2502 ")
  )

;; smartparens
(require 'smartparens-config)
(sp-local-pair 'org-mode "\\[" "\\]")
(sp-local-pair 'org-mode "$" "$")
(sp-local-pair 'org-mode "'" "'" :actions '(rem))
(sp-local-pair 'org-mode "=" "=" :actions '(rem))
(sp-local-pair 'org-mode "_" "_" :actions '(rem))
(sp-local-pair 'org-mode "\\left(" "\\right)" :trigger "\\l(" :post-handlers '(sp-latex-insert-spaces-inside-pair))
(sp-local-pair 'org-mode "\\left[" "\\right]" :trigger "\\l[" :post-handlers '(sp-latex-insert-spaces-inside-pair))
(sp-local-pair 'org-mode "\\left\\{" "\\right\\}" :trigger "\\l{" :post-handlers '(sp-latex-insert-spaces-inside-pair))
(sp-local-pair 'org-mode "\\left|" "\\right|" :trigger "\\l|" :post-handlers '(sp-latex-insert-spaces-inside-pair))

(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "english") ; this can obviously be set to any language your spell-checking program supports
;; (add-hook 'org-mode-hook 'flyspell-mode)
;; (add-hook 'org-mode-hook 'flyspell-buffer)

;; (defun generate-latex-preview-on-save ()
;;   (save-excursion
;;     (goto-char 0)
;;     (org-toggle-latex-fragment '(16))
;;     )
;;   )

;; (add-hook 'before-save-hook '(generate-latex-preview-on-save))

;; (add-hook 'org-mode-hook (lambda ()
;;    "Beautify Org Checkbox Symbol"
;;    (push '("[ ]" .  "☐") prettify-symbols-alist)
;;    (push '("[X]" . "☑" ) prettify-symbols-alist)
;;    (push '("[-]" . "❍" ) prettify-symbols-alist)
;;    (prettify-symbols-mode)))
