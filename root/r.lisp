(defpackage :r
  (:export cli repl)
  (:use :cl))
(in-package :r)

(defvar *argv*)
(defvar *ps1* "lisp>-? ")
(defvar *ps2* "lisp... ")

(defun read-prompt (&optional ps (file *debug-io*))
  (princ (or ps *ps1*) file)
  (force-output file)
  (read))

(defun printlns (&optional (x "") (file *standard-output*))
  (fresh-line file)
  (princ x file)
  (terpri file)
  x)

(defun printlnd (&optional (x ""))
  (printlns x *debug-io*))

(defun repl ()
  (loop
    (handler-case
	(printlns (eval (read-prompt)))
      (end-of-file (c)
	(return-from repl c))
      (t (c)
	(format *debug-io* ">> Condition:[~s] ~a~%" c c)))))

(defun cli (argv)
  (declare (ignorable argv))
  (printlnd ">> Hello!")
  (repl)
  (fresh-line)
  (printlnd ">> Bye!"))
