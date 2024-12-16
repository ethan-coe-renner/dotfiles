;;; my.el --- My miscellaneous elisp snippets -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Ethan Coe-Renner
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;; This file contains miscellaneous elisp snippets for use in my Emacs configuration.
;;
;;; Code:

(defun my-chezmoi-apply ()
  "Apply chezmoi configuration."
  (interactive)
  (shell-command "chezmoi apply"))

(defvar my-chezmoi-dir (expand-file-name "~/.local/share/chezmoi/"))

(defun my-find-dotfile ()
  "Open a file somewhere in chezmoi via a fuzzy filename search."
  (interactive)
  (doom-project-find-file my-chezmoi-dir))

(defun my-open-dotfiles ()
  "Open chezmoi in Dired."
  (interactive)
  (dired my-chezmoi-dir))

(defun my-switch-to-other-buffer ()
  "Switch to the most recently opened buffer."
  (interactive)
  (switch-to-buffer (other-buffer))
  )

(defun my-switch-to-eshell ()
  "Switch to the existing *eshell* buffer or create one if it doesn't exist."
  (interactive)
  (if (get-buffer "*eshell*")
      (switch-to-buffer "*eshell*")
    (eshell)))

(provide 'my)
;;; my.el ends here
