#lang scheme
(require "mods/math.scm" "mods/math-install.scm")

(install-math)

(define z (make-complex-from-real-imag 1 2))
(define pz (make-complex-from-mag-ang 0 0.8))
(define r1 (make-rational 0 2))
(define n2 (make-scheme-number 0))


(define (test1) (=zero? z))
(define (test2) (=zero? pz))
(define (test3) (=zero? r1))
(define (test4) (=zero? n2))

(define (test)
  (list 1 (test1) 2 (test2) 3 (test3) 4 (test4)))
