#lang scheme
(require "mods/math.scm" "mods/math-install.scm")

(install-math)

(define pz (make-complex-from-mag-ang 2 0.7))
(define rz (make-complex-from-real-imag 3 5))

(define (test)
  (add (sub rz pz) pz))
