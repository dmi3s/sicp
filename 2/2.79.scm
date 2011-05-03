#lang scheme
(require "mods/math.scm" "mods/math-install.scm")

(install-math)

(define az (make-complex-from-real-imag 1 2))
(define bz (make-complex-from-real-imag 2 8))
(define aaz (make-complex-from-real-imag 1 2))
(define pz1 (make-complex-from-mag-ang 5 0.8))
(define pz2 (make-complex-from-mag-ang 7 0.4))
(define r1 (make-rational 1 2))
(define r2 (make-rational 3 5))
(define n1 (make-scheme-number 17))
(define n2 (make-scheme-number 34))


(define (test1) (equ? az aaz))
(define (test2) (equ? az bz))
(define (test3) (equ? pz1 pz2))
(define (test4) (equ? pz1 az))
(define (test5) (equ? r1 r1))
(define (test6) (equ? r2 r1))
(define (test7) (equ? n2 n2))
(define (test8) (equ? n1 n2))

(define (test)
  (list 1 (test1) 2 (test2) 3 (test3) 4 (test4)
        5 (test5) 6 (test6) 7 (test7) 8 (test8)))
