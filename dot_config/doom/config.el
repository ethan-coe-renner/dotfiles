;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(use-package! emacs
  :init
  ;; Load my elisp snippets
  (org-babel-load-file (concat doom-user-dir "my.org"))

  :custom
  (doom-theme 'modus-operandi)
  (display-line-numbers-type nil)

  ;; Needed if $SHELL is a non-POSIX shell
  (shell-file-name (executable-find "bash"))

  ;; Automatically open read only buffers in view-mode
  (view-read-only t)

  ;; Focus follows mouse
  ;; (mouse-autoselect-window t)
  )

;; --- Miscellaneous Keybindings ---
(map!
 (
  "M-RET" #'my/switch-to-eshell
  "C-/" #'consult-line
  )

 ;; Window movement
 (
  "M-<up>" #'windmove-up
  "M-<down>" #'windmove-down
  "M-<left>" #'windmove-left
  "M-<right>" #'windmove-right

  "M-S-<up>" #'windmove-swap-states-up
  "M-S-<down>" #'windmove-swap-states-down
  "M-S-<left>" #'windmove-swap-states-left
  "M-S-<right>" #'windmove-swap-states-right
  )

 :leader
 ;; Alternate keybinding for my/switch-to-eshell
 (:desc "Switch to eshell" "RET" #'my/switch-to-eshell)
 (:prefix ("f")
  :desc "Find file in chezmoi" "p" #'my/find-dotfile
  :desc "Browse chezmoi" "P" #'my/open-dotfiles)
 (:prefix ("b")
  :desc "Switch buffer" "b" #'consult-buffer)
 (:prefix ("s")
          "R" #'deadgrep)
 (:prefix ("o")
  :desc "Elfeed" "n" #'elfeed)
 (:prefix ("h")
          "h" #'helpful-at-point))

;; --- Package Configurations ---
(use-package! dashboard
  :custom
  (dashboard-items '((bookmarks . 10)
                     (agenda . 10)
                     (recents . 3)
                     ))

  (dashboard-startup-banner 3)

  ;; Center content
  (dashboard-center-content t)

  ;; Use icons
  (dashboard-display-icons-p t)
  (dashboard-icon-type 'nerd-icons)
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)

  (dashboard-week-agenda t)

  ;; Allows dashboard to work in client frames
  (initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

  :config
  (dashboard-setup-startup-hook))

(use-package! org
  :custom
  (org-directory "~/org/")
  (org-todo-keywords '((sequence "TODO" "DONE")))

  (org-capture-templates
   '(
     ("s" "Scratch" entry
      (file "scratch.org")
      "* %?\n%i\n\n")

     ("t" "Todo" entry
      (file+headline "todo.org" "Inbox")
      "* TODO %?\n\n")
     )
   )
  )

(use-package! tramp
  :config
  ;; Add rust programs to remote path
  (add-to-list 'tramp-remote-path "~/.cargo/bin")
  )

(use-package! denote
  :custom
  (denote-directory "~/org/denote")
  (denote-dired-directories (list denote-directory))
  (denote-dired-directories-include-subdirectories t)
  (denote-rename-buffer-format "Denote:%t")

  ;; TODO: consider more denote keywords
  (denote-known-keywords '("emacs" "dev"))
  (denote-sort-keywords t)

  (denote-date-prompt-use-org-read-date t)

  (denote-backlinks-show-context t)
  :hook
  (dired-mode . denote-dired-mode-in-directories)
  :init
  (map! :leader :desc "Denote" "n d" #'denote-open-or-create)

  :config
  (denote-rename-buffer-mode 1))

(use-package! consult-denote
  :config
  (consult-denote-mode 1)
  (map! :leader :desc "Search denote" "s n" #'consult-denote-grep
        :desc "Find denote" "f n" #'consult-denote-find)
  )

(use-package! devdocs
  :init
  (map! "C-h D" #'devdocs-lookup)
  )

(use-package! elfeed
  :config
  (map! :map elfeed-search-mode-map
        :n "r" #'elfeed-update
        ;; :n "q" #'elfeed-kill-buffer
        )
  )

(use-package! elfeed-org
  :init
  (elfeed-org)
  :custom
  (rmh-elfeed-org-files (list (concat org-directory "elfeed.org")))
  )

(use-package! deadgrep
  :config
  (map! :map deadgrep-mode-map
        :n "j" #'deadgrep-forward-match
        :n "k" #'deadgrep-backward-match
        :n "?" #'deadgrep-search-term
        :n "d" #'deadgrep-directory
        :n "f" #'deadgrep-cycle-files
        :n "t" #'deadgrep-cycle-search-type
        :n "c" #'deadgrep-cycle-search-case
        :n "C" (defhydra deadgrep-context ()
                 "context"
                 ("B" deadgrep-increment-before-context "increment before context")
                 ("b" deadgrep-decrement-before-context "decrement before context")
                 ("A" deadgrep-increment-after-context "increment after context")
                 ("a" deadgrep-decrement-after-context "decrement after context")
                 )
        )
  )

(after! eshell
  ;; Keymap overrides
  (map! :map eshell-mode-map
        "M-RET" #'bury-buffer
        :i "M-r" #'consult-history
        )

  (set-eshell-alias!
   "git" "git $1" ;; use pager for git
   "g" "magit"
   "gl" "magit-log"
   "glc" "magit-log-current"
   "ff" "find-file-other-window $1"
   "d" "dired-other-window $1"
   )

  (use-package! esh-autosuggest
    :hook (eshell-mode . esh-autosuggest-mode))
  )

(use-package! dumb-jump
  :custom
  (dumb-jump-force-searcher 'rg)

  :hook
  (xref-backend-functions . dumb-jump-xref-activate)
  )

(use-package! jinx
  :hook (emacs-startup . global-jinx-mode)
  :bind (("M-$" . jinx-correct)))

(use-package! buffer-terminator
  :custom
  (buffer-terminator-verbose nil)
  :config
  (buffer-terminator-mode 1))

(use-package! fontaine
  :config
  (setq fontaine-presets
        '(
          (small
           :default-family "Iosevka Comfy"
           :default-height 100)
          (medium
           :default-family "Iosevka Comfy Wide"
           :default-height 140)
          (large
           :default-family "Iosevka Comfy Wide"
           :default-height 150)))
  (fontaine-set-preset 'medium)
  :init
  (fontaine-mode 1)
  (map! :leader :desc "Font size" "t b" #'fontaine-set-preset)
  )

(use-package! spacious-padding
  :config
  (spacious-padding-mode 1)
  )

(after! modus-themes
  (map! :leader :desc "Theme" "t t" #'modus-themes-toggle))

;; Modus themes are my default, but ef are nice for some color
(use-package! ef-themes
  :custom
  (ef-themes-to-toggle '(ef-bio ef-spring))
  :init
  (map! :leader :desc "Ef theme" "t T" #'ef-themes-toggle))
