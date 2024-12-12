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
(load! "my")

(setq org-directory "~/org/")

;; Automatically open read only buffers in view-mode
(setq view-read-only t)

;; --- UI ---
(setq doom-font (font-spec :family "Fira Code" :size 15))
(setq doom-theme 'ef-bio)
(setq display-line-numbers-type t)

;; Use a minimal dashboard with just a splash image
(setq +doom-dashboard-functions '(doom-dashboard-widget-banner)
      fancy-splash-image (concat doom-user-dir "emacs.png"))


;; --- Miscellaneous Keybindings ---
(map!
 :leader
 (:prefix ("f")
  :desc "Find file in chezmoi" "p" #'my-find-dotfile
  :desc "Browse chezmoi" "P" #'my-open-dotfiles)
 (:prefix ("h")
          "h" #'helpful-at-point))



;; --- Package Configurations ---

(use-package! dashboard
  :custom
  ;; show dashboard in frames created with emacsclient -c
  (initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))

  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-center-content t)
  (dashboard-show-shortcuts nil)

  (dashboard-items '((bookmarks . 5)
                     (agenda    . 5)))
  :config
  (dashboard-setup-startup-hook))

(after! eshell
  (set-eshell-alias!
   "g" "magit"
   "gl" "magit-log"
   "ch" "chezmoi"))

(use-package! denote
  :custom
  (denote-directory "~/notes")
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


(use-package! elfeed
  :custom
  (elfeed-feeds '(
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

  :init
  (map! :leader :desc "Elfeed" "o r" #'elfeed))

(use-package! ef-themes
  :custom
  (ef-themes-to-toggle '(ef-bio ef-spring))
  :init
  (map! :leader :desc "Theme" "t t" #'ef-themes-toggle))
