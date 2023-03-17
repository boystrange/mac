
;;
;; AUXILIARY DEFINITIONS
;;

(defun try-load (name)
  (if (file-readable-p name) (load name)))

(add-to-list 'load-path "~/GIT/fira-code-emacs/")

;;
;; PACKAGES
;;

(require 'package)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; install use-package if necessary
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;
;; EXEC-PATH-FROM-SHELL
;;

(use-package exec-path-from-shell
  :ensure t)

;;
;; MODE LINE
;;

;; (use-package powerline
  ;; :ensure t
  ;; :config (powerline-default-theme)
  ;; The following is necessary to fix the colors
  ;; :hook (after-init . powerline-reset)
;; )

;;
;; THEME
;;

(use-package base16-theme
  :ensure t)

(use-package heaven-and-hell
  :ensure t
  :init
  (setq heaven-and-hell-theme-type 'dark) ;; Omit to use light by default
  (setq heaven-and-hell-themes
        '((light . base16-tomorrow)
          (dark  . base16-tomorrow-night))) ;; Themes can be the list: (dark . (tsdh-dark wombat))
  ;; Load themes without asking for confirmation.
  (setq heaven-and-hell-load-theme-no-confirm t)
  :config
  ;; Define a command to toggle theme that also resets powerline
  (defun my-toggle-theme ()
    (interactive)
    (progn (heaven-and-hell-toggle-theme) (powerline-reset)))
  :hook (after-init . heaven-and-hell-init-hook)
  :bind ("<f6>" . my-toggle-theme))

;;
;; FONT
;;

;; Set default font size depending on system name

(defconst default-font-size
  (cond
    ((string-prefix-p "iperione" system-name) 16) ;; laptop => small screen
    ((string-prefix-p "titan" system-name) 16) ;; close screen
    ((string-prefix-p "oberon" system-name) 18) ;; office => big screen
    (t 18)
  )
)

(defconst default-font
  (font-spec :family "DejaVu Sans Mono"
             :size default-font-size
             :weight 'normal
             :width 'normal) 
)

(defconst startup-font
  (font-spec :family "Fira Code"
             :size default-font-size
             :weight 'light
             :width 'normal) 
)

(let ((my-font "DejaVu Sans Mono"))
  (set-fontset-font "fontset-default" '(#x000000 . #x3FFFFF) default-font)
  (set-fontset-font "fontset-startup" '(#x000000 . #x3FFFFF) startup-font))

(if (eq system-type 'darwin)
  (progn
    (mac-auto-operator-composition-mode t)
    (setq mac-mouse-wheel-smooth-scroll nil))
)

(add-to-list 'default-frame-alist '(height . 40))
(add-to-list 'default-frame-alist '(width . 80))

;; To change the font size interactively per buffer:
;; Up:    C-x C-+, C-x C-=
;; Down:  C-x C--
;; Reset: C-x C-0

;; Set more convenient key bindings for increasing/decreasing font size

(global-set-key (kbd "<M-up>") 'text-scale-increase)
(global-set-key (kbd "<M-down>") 'text-scale-decrease)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; FIRA CODE LIGATURES ;;
;;;;;;;;;;;;;;;;;;;;;;;;;

;;(try-load "~/GIT/fira-code-emacs/fira-code.el")
;;(add-hook 'prog-mode-hook 'fira-code-mode)

;;
;; GUI
;;

;; Don't show the startup screen

(setq inhibit-startup-message t)
(setq inhibit-startup-screen t)

;; Use "y or n" instead of "yes or no"

(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight regions

(setq transient-mark-mode t)

;; Display line and column numbers

(setq line-number-mode    t)
(setq column-number-mode  t)

;; Remove fringes

(when (fboundp 'set-fontset-font)
  (set-fringe-mode 0)
)

;; Scroll bars and scrolling

;; disable scroll bars except on ant where for some reason their
;; disabling leaves an empty region at the top of the buffer

(when (fboundp 'toggle-scroll-bar)
  (toggle-scroll-bar -1))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively 10000)

;; Turn off any bell alarm

(setq ring-bell-function 'ignore)

;; New files are opened in the same frame

(setq ns-pop-up-frames nil)

;; Turn off the menu bar

;; (menu-bar-mode -1)

;; Turn off the tool bar

(tool-bar-mode -1)

;; Always follow symbolic links to version-controlled files
;;
(setq vc-follow-symlinks t)

;;
;; KEYBOARD & SHORTCUTS
;;

;; Use option key as meta; command key as super

(setq mac-option-key-is-meta t
      mac-command-key-is-meta nil
      mac-command-modifier 'none
      mac-option-modifier 'meta
      mac-right-option-modifier 'none)

;; map the window manipulation keys to meta 0, 1, 2, o

(global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
(global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
(global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
(global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
(global-set-key (kbd "M-]") 'next-multiframe-window)
(global-set-key (kbd "M-[") 'previous-multiframe-window)

(defun pull-next-line()
  (interactive)
  (move-end-of-line 1)
  (kill-line)
  (fixup-whitespace)
)
(global-set-key (kbd "M-J") 'pull-next-line)

;;
;; FILE SYSTEM
;;

;; Remeber recent files across sessions

(require 'recentf)
(recentf-mode t)

;; Ignore these extensions in completion

(setq completion-ignored-extensions
      '(".o" "~" ".pdf" ".toc" ".aux" ".lof" ".blg" ".bbl" ".hi" ".agdai"))

;; Ignore case when completing file and buffer names

(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

;;
;; EDITING BEHAVIOR
;;

;; Completion using substrings, not just prefixes

(add-to-list 'completion-styles 'substring)

;; Parentheses

(show-paren-mode t)
(electric-pair-mode t)

(setq-default show-trailing-whitespace t)

;; Delete selection when typing

(setq delete-selection-mode t)

;; Truncate lines by default, even on split windows

(set-default 'truncate-lines t)

;; Line-wrapping

(set-default 'fill-column 68)

;; Enables visual line mode when editing text files
;;
;; (add-hook 'text-mode-hook 'visual-line-mode)
;; (add-hook 'latex-mode-hook 'visual-line-mode)

;;
;; INPUT METHOD
;;

;; (try-load "~/GIT/personal/Config/luca-input-method.el")

;;
;; ENVIRONMENT
;;

;; fix AucTeX for El Capitan and later versions

(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)

;; Set default folder to GIT

(cd "~/GIT")

;;
;; WC MODE
;;

(use-package wc-mode
  :ensure t)

;;
;; MARKDOWN
;;

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "multimarkdown")
  ;; Fontify code blocks
  (setq markdown-fontify-code-blocks-natively t)
  ;; Color math equations
  (setq markdown-enable-math t)
  :config
  ;; Make sure that code blocks inherit the font face of the main text
  (set-face-attribute 'markdown-code-face nil :background nil :inherit nil)
  (set-face-attribute 'markdown-inline-code-face nil :background nil :inherit nil)
  )

;;
;; HASKELL
;;

(use-package haskell-mode
  :ensure t
  :mode (("\\.x\\'" . haskell-mode)
	 ("\\.y\\'" . haskell-mode))
  :init
  (setq haskell-literate-default (quote tex))
  :hook
  (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
  )

;;
;; AGDA
;;

;; make sure agda is in the path
(if (eq system-type 'darwin)
  (progn
    (exec-path-from-shell-initialize)
    (load-file (let ((coding-system-for-read 'utf-8))
                    (shell-command-to-string "agda-mode locate"))))
)

(add-to-list 'auto-mode-alist '("\\.lagda.md\\'" . agda2-mode))

;;
;; HTML/CSS
;;

;; Attiva modo CSS per i file con estensione .less e .sass
;;
(add-to-list 'auto-mode-alist '("\\.less\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.sass\\'" . css-mode))

;;
;; CUSTOM SYNTAX HIGHLIGHTING
;;

;; (try-load "~/GIT/personal/Projects/Cobalt/emacs/cobalt.el")
;; (try-load "~/GIT/MailboxTypes/Tools/MCC/emacs/mc.el")
;; (try-load "~/GIT/fudo/emacs/fudo.el")

;;
;; LATEX
;;

(use-package tex-site
  :ensure auctex
  :mode (("\\.lhs\\'" . latex-mode))
  :config
  ;; In Mac OSX use "open" to open pdf files
  (setq TeX-view-program-list '(("Open" "open -a Skim %o")))
  (setq TeX-view-program-selection '((output-pdf "Open")
				     (output-dvi "Open")))
  ;; Prevent AUCTeX from using a proportional font for section names
  (setq font-latex-fontify-script nil)     ;; do not fontify scripts
  (setq font-latex-fontify-sectioning 'color) ;; same size as rest of the document

  ;; Use pdflatex by default
  (setq TeX-PDF-mode t)

  ;; Don't remember why this is necessary
  (setq safe-local-variable-values (quote ((TeX-master . "main"))))

  ;; Make sure Literate Haskell documents are compiled with pdflatex
  (eval-after-load "tex"
    '(progn
       (add-to-list 'LaTeX-command-style '("lhs" "pdflatex"))
       (add-to-list 'TeX-file-extensions "lhs")))

  :hook (LaTeX-mode . visual-line-mode)
  )

;;
;; CUSTOM-SET-VARIABLES
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-environment-list
   '(("verbatim" current-indentation)
     ("verbatim*" current-indentation)
     ("tabular")
     ("tabular*")
     ("align")
     ("align*")
     ("array")
     ("eqnarray")
     ("eqnarray*")
     ("displaymath")
     ("equation")
     ("equation*")
     ("picture")
     ("tabbing")
     ("table")
     ("table*")))
 '(agda2-highlight-face-groups 'default-faces)
 '(custom-enabled-themes '(base16-tomorrow-night))
 '(custom-safe-themes
   '("1f82b7df8a4ce0e2ba3b0217d2c552b2fe5b5dd1244481cb65bef733f9818c63" "383bbe6c33de0f8b5f90e7b487e0f45cd5331ba72c3e1fa62d0dec4204329a4a" "b39e101fb7ff65e46374e9f7b81ba8479690a8950597a50dd0a22bc0b1d06d9e" "594df9401f0f37916120d7afe00bd7cc80025eb548cf1e19075ce3845b2f84ae" "3380a2766cf0590d50d6366c5a91e976bdc3c413df963a0ab9952314b4577299" default))
 '(package-selected-packages
   '(go-mode yaml-mode exec-path-from-shell rich-minority heaven-and-hell use-package base16-theme markdown-mode smooth-scrolling wc-mode haskell-mode auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
