;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Fira Code" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'ef-bio)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; We keep configuration in chezmoi, so this keybinding is useless
;; TODO: we could try to update the underlying function (doom/open-private-config)
;; to use the correct path
(assoc-delete-all "Open private configuration" +doom-dashboard-menu-sections)

;; Set splash image for dashboard
(setq fancy-splash-image (concat doom-user-dir "emacs.png"))

;; Setup some aliases for use in eshell
(set-eshell-alias!
 "g" "magit"
 "gl" "magit-log"
 "ch" "chezmoi"
 )

;; --- Package Configurations ---
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
  (map! :leader :desc "Open/create denote" "d" #'denote-open-or-create)

  :config
  (denote-rename-buffer-mode 1)
  )

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
                  ("https://xkcd.com/atom.xml" comic)
                  ))
  :init
  (map! :leader :desc "Open Elfeed" "r" #'elfeed)
  )

(use-package! ef-themes
  :custom
  (ef-themes-to-toggle '(ef-bio ef-spring))
  )

