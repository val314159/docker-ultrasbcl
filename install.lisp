(defvar *dist-url* "http://beta.quicklisp.org/dist/quicklisp/2015-12-18/distinfo.txt")

(load "quicklisp.lisp")

(quicklisp-quickstart:install :path "/root/quicklisp/" :dist-url *dist-url*)

(with-open-file (out "/root/.sbclrc" :direction :output)
  (format out "(load \"/root/quicklisp\/setup.lisp\")"))

(ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)

(ql:quickload :quicklisp-slime-helper)
(ql:quickload :ly)
(ql:quickload :cl-repl)
