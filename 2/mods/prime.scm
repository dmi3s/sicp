#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(provide prime?)

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (next n)  
    (if (= n 2) 3 (+ n 2)))
  (define (square x) (* x x))    
  (define (divides? a b)
    (= (remainder b a) 0))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
