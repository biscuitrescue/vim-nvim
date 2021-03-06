(require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "https://melpa.org/packages/"))
  (setq package-list '(
  ;; emacs
  use-package

  ;; completion
  company counsel ivy prescient company-prescient
  ivy-prescient

   ;; modes
  projectile python-mode pyvenv auto-virtualenv rainbow-mode

  ;; utilities
  saveplace super-save simpleclip undo-fu yasnippet
  unfill popper burly

  deft restart-emacs dashboard

  ;; keyboard
  evil which-key general smartparens hydra evil-surround
  evil-snipe evil-org evil-anzu evil-collection

  ;; themes
  modus-themes doom-themes kaolin-themes dashboard visual-fill-column
  diminish doom-modeline hide-mode-line writeroom-mode all-the-icons
  all-the-icons-ivy-rich presentation

  ;; org
  ox-reveal ox-huge org-superstar org-mode org-super-agenda org-gcal
  toc-org org-ql org-appear org-ql org-tree-slide

  ))
;;  (package-refresh-contents)
  (package-initialize)
(setq package-enable-at-startup nil)

;; Install packages that aren't installed
(unless package-archive-contents
(package-refresh-contents))
(dolist (package package-list)
(unless
(package-installed-p package) (package-install package)))

;; Installing use-package
(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose nil)

(server-start)

  ;; A cool mode to revert window configurations.
    (winner-mode 1)

    (fset 'yes-or-no-p 'y-or-n-p)
    (setq confirm-kill-emacs 'yes-or-no-p)

  ;; Major mode of new buffers
    (setq initial-major-mode 'org-mode)
;; Don't resize the frames in steps; it looks weird, especially in tiling window
;; managers, where it can leave unseemly gaps.
  (setq frame-resize-pixelwise t)
(setq window-resize-pixelwise nil)
 (setq-default truncate-lines t)

(setq-default tab-width 4)

      (setq-default fill-column 80)

    ;; Remove toolbar, menubar etc
    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)

    ;; set nu
    (global-display-line-numbers-mode 1)
    (global-visual-line-mode 1)
    (setq display-line-numbers-type 'relative)

    (use-package paren
      ;; highlight matching delimiters
      :ensure nil
      :config
      (setq show-paren-delay 0.1
	    show-paren-highlight-openparen t
	    show-paren-when-point-inside-paren t
	    show-paren-when-point-in-periphery t)
      (show-paren-mode 1))
    (setq sentence-end-double-space nil) ;; Sentences end with one space

  (setq bookmark-fontify nil)
;; BACKUPS/LOCKFILES --------
;; Don't generate backups or lockfiles.
(setq create-lockfiles nil
      make-backup-files nil
      ;; But in case the user does enable it, some sensible defaults:
      version-control t     ; number each backup file
      backup-by-copying t   ; instead of renaming current file (clobbers links)
      delete-old-versions t ; clean up after itself
      kept-old-versions 5
      kept-new-versions 5
      backup-directory-alist (list (cons "." (concat user-emacs-directory "backup/"))))

(use-package recentf
  :ensure nil
  :config
  (setq ;;recentf-auto-cleanup 'never
   ;; recentf-max-menu-items 0
   recentf-max-saved-items 200)
  ;; Show home folder path as a ~
  (setq recentf-filename-handlers  
	(append '(abbreviate-file-name) recentf-filename-handlers))
  (recentf-mode))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(set-face-attribute 'default nil
:font "saucecodepro nerd font 13" 
:weight 'medium)
(set-face-attribute 'fixed-pitch nil
:font "saucecodepro nerd font 13" 
:weight 'medium)
;; (setq-default line-spacing 0.10)
(add-to-list 'default-frame-alist '(font . "saucecodepro nerd font 13"))

(global-set-key (kbd "C-=") 'text-scale-increase)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

mouse-wheel-scroll-progressive-speed nil

(use-package which-key
:diminish which-key-mode
:init
(which-key-mode)
(which-key-mode-setup-minibuffer)
:config
(setq which-key-idle-delay 0.3)
(setq which-key-prefix-prefix "??? ")
(setq which-key-sort-order 'which-key-key-order-alpha
      which-key-min-display-lines 2
      which-key-max-display-columns 4))

(use-package evil
  :init
  ;; (setq evil-want-keybinding t)
  (setq evil-want-fine-undo t)
  (setq evil-want-keybinding nil)
  (setq evil-want-Y-yank-to-eol t)
  :config

  (evil-set-initial-state 'dashboard-mode 'motion)
  (evil-set-initial-state 'debugger-mode 'motion)
  (evil-set-initial-state 'pdf-view-mode 'motion)
  (evil-set-initial-state 'bufler-list-mode 'emacs)

  ;; ----- Keybindings
  ;; I tried using evil-define-key for these. Didn't work.
  ;; (define-key evil-motion-state-map "/" 'swiper)
  (define-key evil-window-map "\C-q" 'evil-delete-buffer) ;; Maps C-w C-q to evil-delete-buffer (The first C-w puts you into evil-window-map)
  (define-key evil-window-map "\C-w" 'kill-this-buffer)
  (define-key evil-motion-state-map "\C-b" 'evil-scroll-up) ;; Makes C-b how C-u is

  ;; ----- Setting cursor colors
  (setq evil-emacs-state-cursor    '("#649bce" box))
  (setq evil-normal-state-cursor   '("#ebcb8b" box))
  (setq evil-operator-state-cursor '("#ebcb8b" hollow))
  (setq evil-visual-state-cursor   '("#677691" box))
  (setq evil-insert-state-cursor   '("#eb998b" (bar . 2)))
  (setq evil-replace-state-cursor  '("#eb998b" hbar))
  (setq evil-motion-state-cursor   '("#ad8beb" box))

  ;; ;; Evil-like keybinds for custom-mode-map
  ;; (evil-define-key nil 'custom-mode-map
  ;;   ;; motion
  ;;   (kbd "C-j") 'widget-forward
  ;;   (kbd "C-k") 'widget-backward
  ;;   "q" 'Custom-buffer-done)

  (evil-mode 1))

(use-package evil-surround
  :defer 2
  :config
  (global-evil-surround-mode 1))


(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dired (custom cus-edit) (package-menu package) calc diff-mode))
  (evil-collection-init)
  ;; A few of my own overrides/customizations
  (evil-collection-define-key 'normal 'dired-mode-map
    (kbd "RET") 'dired-find-alternate-file)

  )

;; not working right now, from https://jblevins.org/log/dired-open
;; (evil-define-key 'motion 'dired-mode-map "s-o" '(lambda () (interactive)
;; 												  (let ((fn (dired-get-file-for-visit)))
;; 													(start-process "default-app" nil "open" fn))))

(evil-define-key 'motion 'dired-mode-map "Q" 'kill-this-buffer)
(evil-define-key 'motion help-mode-map "q" 'kill-this-buffer)
(evil-define-key 'motion calendar-mode-map "q" 'kill-this-buffer)

(use-package evil-snipe
:diminish evil-snipe-mode
:diminish evil-snipe-local-mode
:after evil
:config
(evil-snipe-mode +1))

(use-package general
:config
(general-define-key
:states '(normal motion visual)
:keymaps 'override
:prefix "SPC"

"/" '(jib/rg :which-key "ripgrep")
";" '(spacemacs/deft :which-key "deft")
":" '(projectile-find-file :which-key "p-find file")
"." '(counsel-find-file :which-key "find file")
"," '(counsel-recentf :which-key "recent files")
"TAB" '(switch-to-prev-buffer :which-key "previous buffer")
"SPC" '(counsel-M-x :which-key "M-x")
"f s" '(save-buffer :which-key "save buffer")
"w v" '(evil-window-vsplit :which-key "Vertical split")
"w s" '(evil-window-split :which-key "horizontal split")
"w q" '(evil-window-delete :which-key "Close window")

;; Toggles
"t" '(nil :which-key "toggles")
"tt" '(toggle-truncate-lines :which-key "truncate lines")
"tv" '(visual-line-mode :which-key "visual line mode")
"tn" '(display-line-numbers-mode :which-key "display line numbers")
"ta" '(mixed-pitch-mode :which-key "variable pitch mode")
"tc" '(visual-fill-column-mode :which-key "visual fill column mode")
"ht" '(counsel-load-theme :which-key "load theme")
"tw" '(writeroom-mode :which-key "writeroom-mode")
"tR" '(read-only-mode :which-key "read only mode")
"tI" '(toggle-input-method :which-key "toggle input method")
"tr" '(display-fill-column-indicator-mode :which-key "fill column indicator")
"tm" '(hide-mode-line-mode :which-key "hide modeline mode")

(use-package company
  :diminish company-mode
  :general
  (general-define-key :keymaps 'company-active-map
                      "C-j" 'company-select-next
                      "C-k" 'company-select-previous)
  :init
  ;; These configurations come from Doom Emacs:
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 2
        company-tooltip-limit 14
        company-tooltip-align-annotations t
        company-require-match 'never
        company-global-modes '(not erc-mode message-mode help-mode gud-mode)
        company-frontends
        '(company-pseudo-tooltip-frontend  ; always show candidates in overlay tooltip
          company-echo-metadata-frontend)  ; show selected candidate docs in echo area
        company-backends '(company-capf company-files company-keywords)
        company-auto-complete nil
        company-auto-complete-chars nil
        company-dabbrev-other-buffers nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)

  :config
  (setq company-idle-delay 0.35)
  :custom-face
  (company-tooltip ((t (:family "saucecodepro nerd font 13")))))

(use-package ivy
  :diminish ivy-mode
  :config
  (setq ivy-extra-directories nil) ;; Hides . and .. directories
  (setq ivy-initial-inputs-alist nil) ;; Removes the ^ in ivy searches
  (if (eq jib/computer 'laptop)
      (setq-default ivy-height 10)
    (setq-default ivy-height 15))
  (setq ivy-fixed-height-minibuffer t)
  (ivy-mode 1)

  ;; Shows a preview of the face in counsel-describe-face
  (add-to-list 'ivy-format-functions-alist '(counsel-describe-face . counsel--faces-format-function))

  :general
  (general-define-key
   ;; Also put in ivy-switch-buffer-map b/c otherwise switch buffer map overrides and C-k kills buffers
   :keymaps '(ivy-minibuffer-map ivy-switch-buffer-map)
   ;; C-j and C-k to move up/down in Ivy
   "C-k" 'ivy-previous-line
   "C-j" 'ivy-next-line)
  )

;; Nice icons in Ivy. Replaces all-the-icons-ivy.
(use-package all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1)
  :config
  (setq all-the-icons-ivy-rich-icon-size 1.0))

(use-package ivy-rich
  :after (ivy)
  :init
  (setq ivy-rich-path-style 'abbrev)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :config
  (ivy-rich-mode 1))

(use-package counsel
  :config
  (setq default-directory jib/home)
  (setq counsel-switch-buffer-preview-virtual-buffers nil) ;; Removes recentfiles/bookmarks from counsel-switch-buffer
  (setq counsel-find-file-ignore-regexp
	(concat
	 ;; That weird Icon? file in Dropbox.
	 "\\(Icon\
\\)"
	 ;; Hides file names beginning with # or .
	 "\\|\\(?:\\`[#.]\\)"))

  ;; emacs regexp notes: had to put \\| before the second regexp to make this work

  ;; Sorts counsel-recentf in order of time last accessed
  (add-to-list 'ivy-sort-functions-alist
	       '(counsel-recentf . file-newer-than-file-p))

  (add-to-list 'recentf-exclude
	       (expand-file-name "projectile-bookmarks.eld" user-emacs-directory))

  (setq-default counsel--fzf-dir jib/home)
  :general
  (general-define-key :keymaps 'counsel-find-file-map
		      "C-c f" 'counsel-file-jump-from-find)
;; when in counsel-find-file, run this to search the whole directory recursively
  )

(use-package prescient
  :config
  (setq-default history-length 1000)
  (setq-default prescient-history-length 1000) ;; More prescient history
  (prescient-persist-mode +1))

;; Use `prescient' for Ivy menus.
(use-package ivy-prescient
  :after ivy
  :config
  ;; don't prescient sort these commands
  (dolist (command '(org-ql-view counsel-find-file))
    (setq ivy-prescient-sort-commands (append ivy-prescient-sort-commands (list command))))
  (ivy-prescient-mode +1))

(use-package company-prescient
  :defer 2
  :after company
  :config
  (company-prescient-mode +1))

(use-package flyspell
  :defer t
  :config
  (add-to-list 'ispell-skip-region-alist '("~" "~"))
  (add-to-list 'ispell-skip-region-alist '("=" "="))
  (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC"))
  (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_EXPORT" . "^#\\+END_EXPORT"))
  (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_EXPORT" . "^#\\+END_EXPORT"))
  (add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))

  (dolist (mode '(org-mode-hook
                  mu4e-compose-mode-hook))
    (add-hook mode (lambda () (flyspell-mode 1))))
  :general ;; Switches correct word from middle click to right click
  (general-define-key :keymaps 'flyspell-mouse-map
                      "<mouse-3>" #'flyspell-correct-word
                      "<mouse-2>" nil)
  (general-define-key :keymaps 'evil-motion-state-map
                      "zz" #'ispell-word)
  )

(use-package flyspell-correct
  :after flyspell
  :bind (:map flyspell-mode-map ("C-;" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
  :after flyspell-correct)

(use-package evil-anzu :defer t)

(use-package simpleclip
  :config
  (simpleclip-mode 1))
;; Allows pasting in minibuffer with M-v
(add-hook 'minibuffer-setup-hook 'jib/paste-in-minibuffer)



(defun jib/copy-whole-buffer-to-clipboard ()
  "Copy entire buffer to clipboard"
  (interactive)
  (mark-whole-buffer)
  (simpleclip-copy (point-min) (point-max))
  (deactivate-mark))

(use-package undo-fu
  :config
  (define-key evil-normal-state-map "u" 'undo-fu-only-undo)
  (define-key evil-normal-state-map "U" 'undo-fu-only-redo))

(use-package super-save
  :diminish super-save-mode
  :defer 2
  :config
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 5) ;; after 5 seconds of not typing autosave
  (setq super-save-triggers ;; Functions after which buffers are saved (switching window, for example)
        '(evil-window-next evil-window-prev balance-windows other-window))
  (super-save-mode +1))

;; After super-save autosaves, wait __ seconds and then clear the buffer. I don't like
;; the save message just sitting in the echo area.
(defun jib-clear-echo-area-timer ()
  (run-at-time "2 sec" nil (lambda () (message " "))))

(advice-add 'super-save-command :after 'jib-clear-echo-area-timer)

(use-package saveplace
  :init (setq save-place-limit 100)
  :config (save-place-mode))

(use-package yasnippet
  :diminish yas-minor-mode
  :defer 5
  :config
  (setq yas-snippet-dirs (list (expand-file-name "snippets" jib/emacs-stuff)))
  (yas-global-mode 1)) ;; or M-x yas-reload-all if you've started YASnippet already.


;; Silences the warning when running a snippet with backticks (runs a command in the snippet)
;; I use backtick commands to get the date for org snippets
(require 'warnings)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

(use-package mixed-pitch
  :defer t
  :config
  (setq mixed-pitch-set-height nil)
  (dolist (face '(org-date org-priority org-tag org-special-keyword)) ;; Some extra faces I like to be fixed-pitch
    (add-to-list 'mixed-pitch-fixed-pitch-faces face)))

;; Disables showing system load in modeline, useless anyway
(setq display-time-default-load-average nil)

(line-number-mode)
(column-number-mode)
(display-time-mode -1)
(size-indication-mode -1)

(use-package doom-modeline
  :init (doom-modeline-mode)
  :config
  (setq doom-modeline-buffer-file-name-style 'file-name ;; Just show file name (no path)
        doom-modeline-enable-word-count t
        doom-modeline-buffer-encoding nil
        doom-modeline-icon t ;; Enable/disable all icons
        doom-modeline-modal-icon nil ;; Icon for Evil mode
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-bar-width 3))

;; Configure modeline text height based on the computer I'm on.
;; These variables are used in the Themes section to ensure the modeline
;; stays the right size no matter what theme I use.
(if (eq jib/computer 'laptop)
    (setq jib-doom-modeline-text-height 135) ;; If laptop
  (setq jib-doom-modeline-text-height 140))  ;; If desktop

(if (eq jib/computer 'laptop)
    (setq doom-modeline-height 1) ;; If laptop
  (setq doom-modeline-height 1))  ;; If desktop



(use-package all-the-icons) 

(use-package doom-themes
  :after mixed-pitch
  :config
  (doom-themes-visual-bell-config)
  (doom-themes-org-config)
  :custom-face
  (org-ellipsis ((t (:height 0.8 :inherit 'shadow))))
  ;; Keep the modeline proper every time I use these themes.
  (mode-line ((t (:height ,jib-doom-modeline-text-height))))
  (mode-line-inactive ((t (:height ,jib-doom-modeline-text-height))))
  (org-scheduled-previously ((t (:background "red")))))

(use-package kaolin-themes
  :config
  (setq kaolin-themes-modeline-border nil)
  :custom-face
  ;; Keep the modeline proper every time I use these themes.
  (mode-line ((t (:height ,jib-doom-modeline-text-height))))
  (mode-line-inactive ((t (:height ,jib-doom-modeline-text-height))))
  ;; Disable underline for org deadline warnings. I don't like the way it looks.
  (org-warning ((t (:underline nil))))
  ;; Darkens the org-ellipsis (first unset the color, then give it shadow)
  (org-ellipsis ((t (:foreground unspecified :height 0.8 :inherit 'shadow)))))

(use-package modus-themes
  :init
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil
	modus-themes-region '(bg-only no-extend)
	modus-themes-hl-line '(accented) 
	modus-themes-syntax '(yellow-comments)
	modus-themes-mode-line '(accented borderless)) ;; Color modeline in active window, remove border
  (setq modus-themes-headings ;; Makes org headings more colorful
	'((t . (rainbow))))
  (modus-themes-load-themes)
  :custom-face
  (org-ellipsis ((t (:height 0.8 :inherit 'shadow))))
  ;; Keep the modeline proper every time I use these themes.
  (mode-line ((t (:height ,jib-doom-modeline-text-height))))
  (mode-line-inactive ((t (:height ,jib-doom-modeline-text-height)))))

(load-theme 'doom-palenight t)

(use-package dashboard
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'hide-mode-line-mode)
  :config
  (setq dashboard-items '(
                          ;; (bookmarks  . 5)
                          ;; (recents . 6)
                          (registers . 14)))

  ;; Header, footer, messages
  (setq dashboard-banner-logo-title "Welcome to Emacs!")
  (setq dashboard-footer-messages '(""))
  (setq dashboard-footer-icon (all-the-icons-octicon "zap"
                                                     :height 0.00001
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))
  (setq dashboard-startup-banner 'logo)
  ;; (setq dashboard-startup-banner '"~/Dropbox/Mackup/emacs-stuff/banner.txt")
  ;; General config
  (setq dashboard-center-content t
        dashboard-set-heading-icons nil
        dashboard-set-file-icons nil
        dashboard-week-agenda nil
        dashboard-center-content t
        dashboard-set-init-info nil
        dashboard-set-navigator t
        dashboard-items-default-length 30
        dashboard-page-separator "\n\n")
  (dashboard-setup-startup-hook)
  :general
  (general-define-key :keymaps 'dashboard-mode-map
                      "e" nil))

(use-package visual-fill-column
  :defer t
  :config
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t))

(use-package writeroom-mode
  :defer t
  :config
  (setq writeroom-maximize-window nil
        writeroom-header-line "" ;; Makes sure we have a header line, that's blank
        writeroom-mode-line t
        writeroom-global-effects nil) ;; No need to have Writeroom do any of that silly stuff
  (setq writeroom-width 70)
  ;; (add-hook 'writeroom-mode-hook (lambda () (setq-local line-spacing 10)))
  )

(use-package org-super-agenda
  :after org
  :config
  (setq org-super-agenda-header-map nil) ;; takes over 'j'
  (setq org-super-agenda-header-prefix " ??????") ;; There are some unicode "THIN SPACE"s after the ???
  (org-super-agenda-mode))

(use-package org-superstar
  :config
  (setq org-superstar-leading-bullet " ")
  (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
  (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)
                                          ("INPROG-TODO" . 9744)
                                          ("HW" . 9744)
                                          ("STUDY" . 9744)
                                          ("SOMEDAY" . 9744)
                                          ("READ" . 9744)
                                          ("PROJ" . 9744)
                                          ("CONTACT" . 9744)
                                          ("DONE" . 9745)))
  :hook (org-mode . org-superstar-mode))

;; Removes gap when you add a new heading
(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

(use-package evil-org
  :diminish evil-org-mode
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda () (evil-org-set-key-theme))))

(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(use-package org-gcal
  :defer t
  :config
  (setq org-gcal-down-days '20) ;; Only fetch events 20 days into the future
  (setq org-gcal-up-days '10) ;; Only fetch events 10 days into the past
  (setq org-gcal-recurring-events-mode 'top-level)
  (setq org-gcal-remove-api-cancelled-events t) ;; No prompt when deleting removed events

  ;; NOTE - org-gcal ids and calendar configuation is set in 'private.el' for sake of security/privacy.
  )

(use-package org-appear
  :commands (org-appear-mode)
  :hook (org-mode . org-appear-mode)
  :init
  (setq org-hide-emphasis-markers t) ;; A default setting that needs to be t for org-appear

  (setq org-appear-autoemphasis t)  ;; Enable org-appear on emphasis (bold, italics, etc)
  (setq org-appear-autolinks t) ;; Enable on links
  (setq org-appear-autosubmarkers t)) ;; Enable on subscript and superscript

(use-package ox-reveal
  :defer 5)

(setq org-modules '(org-habit))

(eval-after-load 'org
  '(org-load-modules-maybe t))

(use-package org-ql
  :general
  (general-define-key :keymaps 'org-ql-view-map
                      "q" 'kill-buffer-and-window)
  )

(use-package org-tree-slide
  :defer t
  :config
  (setq org-tree-slide-slide-in-effect nil
        org-tree-slide-skip-outline-level 3))

;; (use-package org-pretty-tags
;;   :config
;;   (setq org-pretty-tags-surrogate-strings
;;         (quote
;;          (("bv" . "???")
;;           ("sp" . "???")
;;           ("security" . "????"))))
;;   (org-pretty-tags-global-mode))

;; Org-agenda specific bindings
(evil-define-key 'motion org-agenda-mode-map
  (kbd "f") 'org-agenda-later
  (kbd "b") 'org-agenda-earlier)

(defun jib/org-font-setup ()
  ;; (set-face-attribute 'org-document-title nil :height 1.1) ;; Bigger titles, smaller drawers
  (set-face-attribute 'org-checkbox-statistics-done nil :inherit 'org-done :foreground "green3") ;; Makes org done checkboxes green
  ;; (set-face-attribute 'org-drawer nil :inherit 'fixed-pitch :inherit 'shadow :height 0.6 :foreground nil) ;; Makes org-drawer way smaller
  ;; (set-face-attribute 'org-ellipsis nil :inherit 'shadow :height 0.8) ;; Makes org-ellipsis shadow (blends in better)
  (set-face-attribute 'org-scheduled-today nil :weight 'normal) ;; Removes bold from org-scheduled-today
  (set-face-attribute 'org-super-agenda-header nil :inherit 'org-agenda-structure :weight 'bold) ;; Bolds org-super-agenda headers
  (set-face-attribute 'org-scheduled-previously nil :background "red") ;; Bolds org-super-agenda headers

  ;; Here I set things that need it to be fixed-pitch, just in case the font I am using isn't monospace.
  ;; (dolist (face '(org-list-dt org-tag org-todo org-table org-checkbox org-priority org-date org-verbatim org-special-keyword))
  ;;   (set-face-attribute `,face nil :inherit 'fixed-pitch))

  ;; (dolist (face '(org-code org-verbatim org-meta-line))
  ;;   (set-face-attribute `,face nil :inherit 'shadow :inherit 'fixed-pitch))
  )

(defun jib/org-setup ()
  (org-indent-mode) ;; Keeps org items like text under headings, lists, nicely indented
  (visual-line-mode 1) ;; Nice line wrapping

  (centered-cursor-mode)

  ;; (setq header-line-format "") ;; Empty header line, basically adds a blank line on top
  (setq-local line-spacing (+ jib-default-line-spacing 1))
  )

(use-package org
  :pin gnu
  :hook (org-mode . jib/org-setup)
  :hook (org-mode . jib/org-font-setup)
  :hook (org-mode . jib/prettify-symbols-setup)
  :hook (org-capture-mode . evil-insert-state) ;; Start org-capture in Insert state by default
  :diminish org-indent-mode
  :diminish visual-line-mode
  :config

(setq org-ellipsis "?????? ") ;; ???
(setq org-src-fontify-natively t) ;; Syntax highlighting in org src blocks
(setq org-highlight-latex-and-related '(native)) ;; Highlight inline LaTeX
(setq org-startup-folded 'show2levels) ;; Org files start up folded by default
(setq org-image-actual-width nil)

(setq org-cycle-separator-lines 1)
(setq org-catch-invisible-edits 'smart)
(setq org-src-tab-acts-natively t)

;; M-Ret can split lines on items and tables but not headlines and not on anything else (unconfigured)
(setq org-M-RET-may-split-line '((headline) (item . t) (table . t) (default)))
(setq org-loop-over-headlines-in-active-region nil)

;; Opens links to other org file in same frame (rather than splitting)
(setq org-link-frame-setup '((file . find-file)))

(setq org-log-done t)
(setq org-log-into-drawer t)

;; Automatically change bullet type when indenting
;; Ex: indenting a + makes the bullet a *.
(setq org-list-demote-modify-bullet
      '(("+" . "*") ("*" . "-") ("-" . "+")))

;; Automatically save and close the org files I most frequently archive to.
;; I see no need to keep them open and crowding my buffer list.
;; Uses my own function jib/save-and-close-this-buffer.
(dolist (file '("homework-archive.org_archive" "todo-archive.org_archive"))
  (advice-add 'org-archive-subtree-default :after 
              (lambda () (jib/save-and-close-this-buffer file))))

(setq counsel-org-tags '("qp" "ec" "st")) ;; Quick-picks, extracurricular, short-term

(setq org-tag-faces '(
                      ("bv" . "dark slate blue")
                      ("sp" . "purple3")
                      ("ch" . "PaleTurquoise3")
                      ("cl" . "chartreuse4")
                      ("es" . "brown3")
                      ("Weekly" . "SteelBlue1")
                      ("Robo" . "IndianRed2")
                      ("Misc" . "tan1")
                      ("qp" . "RosyBrown1") ;; Quick-picks
                      ("ec" . "PaleGreen3") ;; Extracurricular
                      ("st" . "DimGrey") ;; Near-future (aka short term) todo
                      ))

;; (setq org-tags-column -64)
(setq org-tags-column 1)

(setq org-todo-keywords '((type
                           "TODO(t)" "INPROG-TODO(i)" "HW(h)" "STUDY" "SOMEDAY"
                           "READ(r)" "PROJ(p)" "CONTACT(c)"
                           "|" "DONE(d)" "CANCELLED(C)")))

(setq org-todo-keyword-faces '(("TODO" nil :foreground "orange1" :inherit fixed-pitch :weight medium)
                               ("HW" nil :foreground "coral1" :inherit fixed-pitch :weight medium)
                               ("STUDY" nil :foreground "plum3" :inherit fixed-pitch :weight medium)
                               ("SOMEDAY" nil :foreground "steel blue" :inherit fixed-pitch)
                               ("CONTACT" nil :foreground "LightSalmon2" :inherit fixed-pitch :weight medium)
                               ("READ" nil :foreground "MediumPurple3" :inherit fixed-pitch :weight medium)
                               ("PROJ" nil :foreground "aquamarine3" :inherit fixed-pitch :weight medium)

                               ("INPROG-TODO" nil :foreground "orange1" :inherit fixed-pitch :weight medium)

                               ("DONE" nil :foreground "LawnGreen" :inherit fixed-pitch :weight medium)
                               ("CANCELLED" nil :foreground "dark red" :inherit fixed-pitch :weight medium)))

(setq org-lowest-priority ?F)  ;; Gives us priorities A through F
(setq org-default-priority ?E) ;; If an item has no priority, it is considered [#D].

(setq org-priority-faces
      '((65 nil :inherit fixed-pitch :foreground "red2" :weight medium)
        (66 . "Gold1")
        (67 . "Goldenrod2")
        (68 . "PaleTurquoise3")
        (69 . "DarkSlateGray4")
        (70 . "PaleTurquoise4")))

;; Org-Babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (shell . t)
   (gnuplot . t)
   ))

(use-package gnuplot)

;; Don't prompt before running code in org
(setq org-confirm-babel-evaluate nil)
(setq python-shell-completion-native-enable nil)

;; How to open buffer when calling `org-edit-special'.
(setq org-src-window-setup 'current-window)

(setq org-habit-preceding-days 6)
(setq org-habit-following-days 6)
(setq org-habit-show-habits-only-for-today nil)
(setq org-habit-today-glyph ????) ;;???
(setq org-habit-completed-glyph ????)
(setq org-habit-graph-column 40)

;; Uses custom time stamps
(setq org-time-stamp-custom-formats '("<%A, %B %d, %Y" . "<%m/%d/%y %a %I:%M %p>"))

(setq org-agenda-restore-windows-after-quit t)

;; Only show upcoming deadlines for tomorrow or the day after tomorrow. By default it shows
;; 14 days into the future, which seems excessive.
(setq org-deadline-warning-days 2)
;; If something is done, don't show it's deadline
(setq org-agenda-skip-deadline-if-done t)
;; If something is done, don't show when it's scheduled for
(setq org-agenda-skip-scheduled-if-done t)
;; If something is scheduled, don't tell me it is due soon
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)


(setq org-agenda-timegrid-use-ampm 1)

;; (setq org-agenda-time-grid '((daily today require-timed)
;;                              (800 900 1000 1100 1200 1300 1400 1500 1600 1700)
;;                              "        "
;; 							 "----------------"))

(setq org-agenda-time-grid nil) ;; I've decided to disable the time grid. 2021-09-22.

(setq org-agenda-block-separator 8213) ;; Unicode: ???
(setq org-agenda-current-time-string "<----------------- Now")
(setq org-agenda-scheduled-leaders '("" ""))
;; note: maybe some day I want to use org-agenda-deadline-leaders

(setq org-agenda-prefix-format '((agenda . " %i %-1:i%?-2t% s")
                                 (todo . "   ")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))

;; https://stackoverflow.com/questions/58820073/s-in-org-agenda-prefix-format-doesnt-display-dates-in-the-todo-view
;; something to look into

(setq org-agenda-custom-commands nil)

(setq jib-org-super-agenda-school-groups
                              '(
                                (:name "Overdue"
                                       :discard (:tag "habit") ;; No habits in this todo view
                                       :face (:background "red")
                                       :scheduled past
                                       :deadline past
                                       :order 2)
                                (:name "Important"
                                       :and (:todo "TODO" :priority "A") ;; Homework doesn't count here
                                       :todo "CONTACT"
                                       :order 3)
                                (:name "Short-term Todo"
                                       :tag "st"
                                       :order 4)
                                (:name "Personal"
                                       :category "personal"
                                       :order 40)
                                (:name "Someday"
                                       :todo "SOMEDAY"
                                       :order 30)
                                (:name "Homework"
                                       :todo ("HW" "READ")
                                       :order 5)
                                (:name "Studying"
                                       :todo "STUDY"
                                       :order 7)
                                (:name "Quick Picks"
                                       :tag "qp"
                                       :order 11)
                                (:name "Projects"
                                       :todo "PROJ"
                                       :order 12)
                                (:name "Weekly"
                                       :tag "weekly"
                                       :order 15)
                                (:name "Extracurricular"
                                       :discard (:todo "SOMEDAY")
                                       :tag "ec"
                                       :order 13)
                                (:name "Todo"
                                       :discard (:category "personal")
                                       :todo ("TODO" "INPROG-TODO")
                                       :order 20)))

(add-to-list 'org-agenda-custom-commands
             '("n" "Super zaen view"
               ((agenda "" ((org-agenda-span 'day) (org-agenda-overriding-header "Today's Agenda:")
                            (org-super-agenda-groups '(
                                                       (:name "Schedule"
                                                              :time-grid t
                                                              :order 1)
                                                       (:name "Tasks"
                                                              ;; :discard (:not (:scheduled today))
                                                              ;; :discard (:deadline today)
                                                              :scheduled t
                                                              :order 2)
                                                       (:name "Unscheduled Tasks"
                                                              :deadline t
                                                              :order 3)
                                                       ))))

                (alltodo "" ((org-agenda-overriding-header "All Tasks:") 
                             (org-super-agenda-groups jib-org-super-agenda-school-groups 
                                                      ))))
               ))

(add-to-list 'org-agenda-custom-commands
             '("m" "Agendaless Super zaen view"
               ((alltodo "" ((org-agenda-overriding-header "Agendaless Todo View")
                             (org-super-agenda-groups (push '(:name "Today's Tasks" ;; jib-org-super-agenda-school-groups, with this added on
                                                                    :scheduled today
                                                                    :deadline today) jib-org-super-agenda-school-groups)
                                                      )))))
             )
;; Org-super-agenda-mode itself is activated in the use-package block

;; By default an org-capture/refile will save a bookmark. This
;; disables that and keeps my bookmark list how I want it.
(setq org-bookmark-names-plist nil)

(setq org-refile-targets (quote (("~/Dropbox/org/work.org" :maxlevel . 2))))
(setq org-outline-path-complete-in-steps nil) ; Refile in a single go
(setq org-refile-use-outline-path t)          ; Show full paths for refilin0


(setq org-capture-templates
      '(
        ("n" "CPB Note" entry (file+headline "~/Dropbox/org/cpb.org" "Refile")
         "** Note: %? @ %U" :empty-lines 0)

        ("w" "Work Todo Entries")
            ("we" "No Time" entry (file "~/Dropbox/org/work.org")
             "** %^{Type|TODO|HW|READ|PROJ} %^{Todo title} %?" :prepend t :empty-lines-before 0)

            ("ws" "Scheduled" entry (file "~/Dropbox/org/work.org")
             "** %^{Type|TODO|HW|READ|PROJ} %^{Todo title}\nSCHEDULED: %^t%?" :prepend t :empty-lines-before 0)

            ("wd" "Deadline" entry (file "~/Dropbox/org/work.org")
             "** %^{Type|TODO|HW|READ|PROJ} %^{Todo title}\nDEADLINE: %^t%?" :prepend t :empty-lines-before 0)

            ("ww" "Scheduled & deadline" entry (file "~/Dropbox/org/work.org")
             "** %^{Type|TODO|HW|READ|PROJ} %^{Todo title}\nSCHEDULED: %^t DEADLINE: %^t %?" :prepend t :empty-lines-before 0)
        ))

(setq org-export-backends '(ascii beamer html latex md odt))

(setq org-export-with-broken-links t)
(setq org-export-with-smart-quotes t)
(setq org-export-allow-bind-keywords t)

;; From https://stackoverflow.com/questions/23297422/org-mode-timestamp-format-when-exported
(defun org-export-filter-timestamp-remove-brackets (timestamp backend info)
  "removes relevant brackets from a timestamp"
  (cond
   ((org-export-derived-backend-p backend 'latex)
    (replace-regexp-in-string "[<>]\\|[][]" "" timestamp))
   ((org-export-derived-backend-p backend 'html)
    (replace-regexp-in-string "&[lg]t;\\|[][]" "" timestamp))))


;; HTML-specific
(setq org-html-validation-link nil) ;; No validation button on HTML exports

;; LaTeX Specific
(eval-after-load 'ox '(add-to-list
                       'org-export-filter-timestamp-functions
                       'org-export-filter-timestamp-remove-brackets))

(use-package ox-hugo
  :defer 2
  :after ox
  :config
  (setq org-hugo-base-dir "~/Dropbox/Projects/cpb"))

(setq org-latex-listings t) ;; Uses listings package for code exports
(setq org-latex-compiler "xelatex") ;; XeLaTex rather than pdflatex

;; not sure what this is, look into it
;; '(org-latex-active-timestamp-format "\\texttt{%s}")
;; '(org-latex-inactive-timestamp-format "\\texttt{%s}")

;; LaTeX Classes
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("org-plain-latex" ;; I use this in base class in all of my org exports.
                 "\\documentclass{extarticle}
         [NO-DEFAULT-PACKAGES]
         [PACKAGES]
         [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )

(setq org-clock-mode-line-total 'current) ;; Show only timer from current clock session in modeline

(setq org-attach-id-dir ".org-attach/")


) ;; This parenthesis ends the org use-package.

(defun jib/deft-kill ()
  (kill-buffer "*Deft*"))

(defun jib/deft-evil-fix ()
  (evil-insert-state)
  (centered-cursor-mode))

(use-package deft
  :config
  (setq deft-directory (concat jib/dropbox "notes/")
        deft-extensions '("org" "txt")
        deft-recursive t
        deft-file-limit 40
        deft-use-filename-as-title t)

  (add-hook 'deft-open-file-hook 'jib/deft-kill) ;; Once a file is opened, kill Deft
  (add-hook 'deft-mode-hook 'jib/deft-evil-fix) ;; Goes into insert mode automaticlly in Deft

  ;; Removes :PROPERTIES: from descriptions
  (setq deft-strip-summary-regexp ":PROPERTIES:\n\\(.+\n\\)+:END:\n")
  :general

  (general-define-key :states 'normal :keymaps 'deft-mode-map
                      ;; 'q' kills Deft in normal mode
                      "q" 'kill-this-buffer)

  (general-define-key :states 'insert :keymaps 'deft-mode-map
                      "C-j" 'next-line
                      "C-k" 'previous-line)
  )

(use-package latex ;; This is a weird one. Package is auctex but needs to be managed like this.
  :ensure nil
  :defer t
  :init
  (setq TeX-engine 'xetex ;; Use XeTeX
        latex-run-command "xetex")

  (setq TeX-parse-self t ; parse on load
        TeX-auto-save t  ; parse on save
        ;; Use directories in a hidden away folder for AUCTeX files.
        TeX-auto-local (concat user-emacs-directory "auctex/auto/")
        TeX-style-local (concat user-emacs-directory "auctex/style/")

        TeX-source-correlate-mode t
        TeX-source-correlate-method 'synctex

        TeX-show-compilation nil

        ;; Don't start the Emacs server when correlating sources.
        TeX-source-correlate-start-server nil

        ;; Automatically insert braces after sub/superscript in `LaTeX-math-mode'.
        TeX-electric-sub-and-superscript t
        ;; Just save, don't ask before each compilation.
        TeX-save-query nil)

  ;; To use pdfview with auctex:
  (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
        TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
        TeX-source-correlate-start-server t)
  :general
  (general-define-key
    :prefix ","
    :states 'normal
    :keymaps 'LaTeX-mode-map
    "" nil
    "a" '(TeX-command-run-all :which-key "TeX run all")
    "c" '(TeX-command-master :which-key "TeX-command-master")
    "c" '(TeX-command-master :which-key "TeX-command-master")
    "e" '(LaTeX-environment :which-key "Insert environment")
    "s" '(LaTeX-section :which-key "Insert section")
    "m" '(TeX-insert-macro :which-key "Insert macro")
    )

  )

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer) ;; Standard way

(use-package company-auctex
  :after auctex
  :init
  (add-to-list 'company-backends 'company-auctex)
  (company-auctex-init))

(use-package mw-thesaurus
  :defer t
  :config
  ;; Binds q to quit in mw-thesaurus
  (add-hook 'mw-thesaurus-mode-hook (lambda () (define-key evil-normal-state-local-map (kbd "q") 'mw-thesaurus--quit))))

(use-package pdf-tools
  :defer t
  :pin manual
  :mode  ("\\.pdf\\'" . pdf-view-mode)
  :config
  (pdf-loader-install)
  (setq-default pdf-view-display-size 'fit-height)
  (setq pdf-view-continuous nil) ;; Makes it so scrolling down to the bottom/top of a page doesn't switch to the next page
  (setq pdf-view-midnight-colors '("#ffffff" . "#121212" )) ;; I use midnight mode as dark mode, dark mode doesn't seem to work
  :general
  (general-define-key :states 'motion :keymaps 'pdf-view-mode-map
                      "j" 'pdf-view-next-page
                      "k" 'pdf-view-previous-page

                      "C-j" 'pdf-view-next-line-or-next-page
                      "C-k" 'pdf-view-previous-line-or-previous-page

                      ;; Arrows for movement as well
                      (kbd "<down>") 'pdf-view-next-line-or-next-page
                      (kbd "<up>") 'pdf-view-previous-line-or-previous-page

                      (kbd "<down>") 'pdf-view-next-line-or-next-page
                      (kbd "<up>") 'pdf-view-previous-line-or-previous-page

                      (kbd "<left>") 'image-backward-hscroll
                      (kbd "<right>") 'image-forward-hscroll

                      "H" 'pdf-view-fit-height-to-window
                      "0" 'pdf-view-fit-height-to-window
                      "W" 'pdf-view-fit-width-to-window
                      "=" 'pdf-view-enlarge
                      "-" 'pdf-view-shrink

                      "q" 'quit-window
                      "Q" 'kill-this-buffer
                      "g" 'revert-buffer
                      )
  )

(use-package popper
  :bind (("C-`"   . popper-toggle-latest)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Warnings\\*"
          help-mode
          compilation-mode))
  (popper-mode +1))

(use-package projectile
  :defer t
  :general
  (:keymaps 'projectile-mode-map
            "s-f" 'projectile-find-file
            "s-p" 'projectile-command-map
            "C-c p" 'projectile-command-map
            "s-c" 'projectile-commander)
  :init
  (projectile-mode +1))

(use-package rainbow-mode
  :defer t)


(use-package hl-todo
  :defer t
  :hook (prog-mode . hl-todo-mode)
  :config
  (setq hl-todo-keyword-faces
      '(("TODO"   . "#FF0000")
        ("FIXME"  . "#FF4500")
        ("DEBUG"  . "#A020F0")
        ("WIP"   . "#1E90FF"))))

;; A better python mode (supposedly)
(use-package python-mode
  :defer t)

;; Using my virtual environments
(use-package pyvenv
  :defer t
  :init
  (setenv "WORKON_HOME" "~/.pyenv/versions")) ;; Where the virtual envs are stored on my computer


;; Automatically set the virtual environment when entering a directory
(use-package auto-virtualenv
  :defer 2
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv))

;; Python development helper
;; (use-package elpy
;;   :defer t
;;   :init
;;   (setq elpy-rpc-virtualenv-path 'current)
;;   (advice-add 'python-mode :before 'elpy-enable))

