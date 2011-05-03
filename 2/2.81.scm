#lang scheme
(require "mods/math.scm" "mods/math-install.scm" "mods/apply-generic.scm")

(install-math)

(define n1 (make-scheme-number 2))
(define n2 (make-scheme-number 2))
(define z  (make-complex-from-mag-ang 12 1.75))

(define (test) (expm n1 n2))
(define (test-e) (expm n1 z))
