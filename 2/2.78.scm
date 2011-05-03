#lang scheme
(require "mods/math.scm" "mods/math-install.scm")

(install-math)

(define a (make-scheme-number 4))
(define b (make-scheme-number 12))

(define (test)
  (div b a))
