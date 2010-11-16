#lang planet neil/sicp

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (= i 0)
        result
        (cont-frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
  (cont-frac-iter k 0))

(define (square x) (* x x))

(define (tan-cf x k)
  (define (n i)
    (if (= i 1) x (- (square x))))
  (define (d i)
    (- (* i 2) 1))
  (cont-frac n d k))