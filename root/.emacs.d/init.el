(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(setq inferior-lisp-program "/usr/bin/sbcl")

(setq slime-contribs '(slime-scratch slime-editing-commands))

(load (expand-file-name "~/quicklisp/slime-helper.el"))

(slime)
