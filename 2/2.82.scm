#lang scheme
(require "mods/math.scm"
         "mods/math-install.scm"
         "mods/get-put.scm"
         "mods/set.scm"
         )

(install-math)
(print-coercion-table)

(define r (make-rational 1 2))
(define n (make-scheme-number 2))


(define (test)
  (add r n))

