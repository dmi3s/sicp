#lang scheme
(require "get-put.scm" 
         "tag.scm"
         "math-scheme-number.scm"
         "math-rational.scm"
         "math-complex.scm"
         "math-complex-rectangular.scm"
         "math-complex-polar.scm"
         )

(provide install-math
         add sub mul div
         real-part imag-part magnitude angle
         apply-generic ; Just for tests
         )

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
           "Нет метода для этих типов -- APPLY-GENERIC"
           (list op type-tags))))))


(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))



(define (install-math)
  (install-scheme-number-package)
  (install-rational-package)
  (install-complex-package)
  (install-rectangular-package)
  (install-polar-package)
  'done-install-math)
