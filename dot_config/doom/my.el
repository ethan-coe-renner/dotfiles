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

(provide 'my)
;;; my.el ends here
