#lang scheme
(require "get-put.scm" 
         "apply-generic.scm"
         )

(provide make-scheme-number make-rational
         make-complex-from-real-imag make-complex-from-mag-ang
         add sub mul div
         real-part imag-part magnitude angle
         equ? =zero?
         )

(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? z) (apply-generic '=zero? z))
  
(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(define (make-rational n d)
  ((get 'make 'rational) n d))

(define (make-complex-from-real-imag x y)
  ((get 'make-from-real-imag 'complex) x y))

(define (make-complex-from-mag-ang r a)
  ((get 'make-from-mag-ang 'complex) r a))

