;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(use-package! emacs
  :init
  ;; Load my elisp snippets
  (org-babel-load-file (concat doom-user-dir "my.org"))

  :custom
  (doom-theme 'modus-operandi)
  (display-line-numbers-type t)

  ;; Open eshell at startup
  (initial-buffer-choice (lambda () (eshell)))

  ;; Automatically open read only buffers in view-mode
  (view-read-only t)

  ;; Focus follows mouse
  (mouse-autoselect-window t)
  )

;; --- Miscellaneous Keybindings ---
(map!
 (
  "M-RET" #'my-switch-to-eshell
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
 ;; Alternate keybinding for my-switch-to-eshell
 (:desc "Switch to eshell" "RET" #'my-switch-to-eshell)
 (:prefix ("f")
  :desc "Find file in chezmoi" "p" #'my-find-dotfile
  :desc "Browse chezmoi" "P" #'my-open-dotfiles)
 (:prefix ("b")
  :desc "Switch buffer" "b" #'consult-buffer
  )
 (:prefix ("h")
          "h" #'helpful-at-point))

;; --- Package Configurations ---
(use-package! org
  :custom
  (org-directory "~/org/")
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

(after! eshell
  ;; Keymap overrides
  (map! :map eshell-mode-map
        "M-RET" #'bury-buffer
        :i "M-r" #'consult-history
        )

  (set-eshell-alias!
   "g" "magit"
   "gl" "magit-log"
   "ff" "find-file-other-window $1"
   "d" "dired-other-window $1"
   )

  (use-package! esh-autosuggest
    :hook (eshell-mode . esh-autosuggest-mode))
  )

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
  (map! :leader "t b" #'fontaine-set-preset)
  )

(after! modus-themes
  (map! :leader :desc "Theme" "t t" #'modus-themes-toggle))

;; Modus themes are my default, but ef are nice for some color
(use-package! ef-themes
  :custom
  (ef-themes-to-toggle '(ef-bio ef-spring))
  )
