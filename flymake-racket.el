;;; flymake-racket.el --- flymake support for racket
;; 
;; Filename: flymake-racket.el
;; Author: Eli Barzilay
;; Maintainer: Samuel Bronson
;; Version: 0.1
;; Last-Updated: Thu Oct  4 21:13:28 2012 (-0400)
;;           By: Samuel Bronson
;;     Update #: 1
;; URL: https://github.com/SamB/flymake-racket
;; Keywords: tools, flymake, racket
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary:
;; 
;; This was originally an answer to the Stack Overflow question at
;; <http://stackoverflow.com/questions/10676099/racket-flymake-mode-for-emacs>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 4-Oct-2012    Samuel Bronson
;;     Added the trappings of a real Emacs package: autoload cookies,
;;     a header, and a customization option.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software; you can redistribute it and/or
;; modify it under terms of your choice.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

;;;###autoload
(defgroup flymake-racket '()
  "Flymake support for Racket."
  :group 'flymake)

(defcustom flymake-racket-program "racket"
  "The program to call to start racket."
  :type 'string)

;;;###autoload
(defun flymake-racket-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list flymake-racket-program
	  (list "-qf" local-file))))

;;;###autoload
(add-to-list 'flymake-allowed-file-name-masks
	     '("\\.rkt\\'" flymake-racket-init))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flymake-racket.el ends here
