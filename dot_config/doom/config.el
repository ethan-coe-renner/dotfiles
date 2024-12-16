;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; Load my elisp snippets
(org-babel-load-file (concat doom-user-dir "my.org"))

(setq org-directory "~/org/")

;; Automatically open read only buffers in view-mode
(setq view-read-only t)

;; --- UI ---
(setq doom-theme 'modus-operandi)
(after! modus-themes
  (map! :leader :desc "Theme" "t t" #'modus-themes-toggle))

(setq display-line-numbers-type t)

;; Open eshell at startup
(setq initial-buffer-choice (lambda () (eshell)))

;; --- Miscellaneous Keybindings ---
(map!
 (
  "M-RET" #'my-switch-to-eshell
  )
 ;; window movement
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
 (:prefix ("h")
          "h" #'helpful-at-point))

;; --- Package Configurations ---
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
  ;; keymap overrides
  (map!
   :map eshell-mode-map
   "M-RET" #'my-switch-to-other-buffer
   )

  (set-eshell-alias!
   "g" "magit"
   "gl" "magit-log"
   "ff" "find-file-other-window $1"
   "d" "dired-other-window $1"
   )
  (use-package! esh-autosuggest
    :hook (eshell-mode . esh-autosuggest-mode))

  (use-package! eshell-info-banner
    :hook (eshell-banner-load . eshell-info-banner-update-banner))
  )

(after! elfeed
  (setq elfeed-feeds '(
                       ;; Blogs
                       ("http://nullprogram.com/feed/" blog)
                       ("https://www.astralcodexten.com/feed" blog)
                       ("https://thezvi.substack.com/feed" blog)
                       ("https://feeds.feedburner.com/mrmoneymustache" blog)
                       ("https://sourcehut.org/blog/index.xml" blog)
                       ("https://drewdevault.com/blog/index.xml" blog)

                       ;; Multi feeds
                       "https://planet.emacslife.com/atom.xml"

                       ;; Comics
                       ("https://xkcd.com/atom.xml" comic)))
  )

(use-package! fontaine
  :config
  (setq fontaine-presets
        '(
          (small
           :default-family "Iosevka Comfy"
           :default-height 90)
          (medium
           :default-family "Iosevka Comfy Wide"
           :default-height 120)
          (large
           :default-family "Iosevka Comfy Wide"
           :default-height 140)))
  (fontaine-set-preset 'medium)
  :init
  (fontaine-mode 1)
  (map! :leader "t b" #'fontaine-set-preset)
  )

;; Disabled while I use modus themes
;; TODO: find a way to nicely integrate these into an alternative set
;; (use-package! ef-themes
;;   :custom
;;   (ef-themes-to-toggle '(ef-bio ef-spring))
;;   :init
;;   (map! :leader :desc "Theme" "t t" #'ef-themes-toggle))
