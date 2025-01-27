;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

(package! dashboard)
(package! literate-calc-mode)
(package! ledger-mode)
(package! esh-autosuggest)
(package! buffer-terminator)
(package! devdocs)
(package! jinx)
(package! deadgrep
  :recipe (:host github
           :repo "ethan-coe-renner/deadgrep"
           :branch "update-context"))

(package! dumb-jump
  ;; For some reason, the next commit reverts a change which fixes xref over
  ;; TRAMP in favor of the deprecated dumb-jump-go over TRAMP.
  ;; This seems weird because the xref mechanism is the recommended approach, and
  ;; dumb-jump-go is deprecated.
  ;; So, I pin this to the previous commit until this is resolved.
  :pin "3c2ab8dfff3a10d3c5f2efd69cfbc81fb5dbbd39")

;; Prot
(package! ef-themes)
(package! denote)
(package! consult-denote)
(package! fontaine)
(package! spacious-padding)

;; Elfeed
;;; I manually install elfeed instead of using the doom module
;;; because I don't want elfeed-goodies
(package! elfeed)
(package! elfeed-org)
