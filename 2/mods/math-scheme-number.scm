#lang scheme
(require "get-put.scm" "tag.scm" "math.scm")

(provide install-scheme-number-package)

(define (install-scheme-number-package)
  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))
  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (eq? x y)))
  (put '=zero? '(scheme-number)
       (lambda (x) (eq? x 0)))
  ;; Type conversions
  (define (scheme-number->complex n-tagged)
    (let ((n (contents n-tagged)))
      (make-complex-from-real-imag n 0)))
  (put-coercion 'scheme-number 'complex scheme-number->complex)
  
  (define (raise n)
    (make-complex-from-real-imag n 0))
  (put 'raise '(scheme-number) raise)
  
  'done-scheme-number)

