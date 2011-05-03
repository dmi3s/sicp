#lang scheme
(require "get-put.scm"
         "tag.scm"
         "math.scm")

(provide install-math-coercion)

(define (install-math-coercion)
  (define (scheme-number->complex n)
    (make-complex-from-real-imag (contents n) 0))
  (put-coercion 'scheme-number 'complex scheme-number->complex)
  'done-math-coercion)