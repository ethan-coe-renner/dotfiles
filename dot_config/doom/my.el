;;; my.el My miscellaneous elisp snippets -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Ethan
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;; This file contains miscellaneous elisp snippets for use in my emacs configuration.
;;
;;; Code:

(defun my-chezmoi-apply ()
  "Apply chezmoi configuration"
  (interactive)
  (shell-command "chezmoi apply"))

(provide 'my)
;;; my.el ends here
