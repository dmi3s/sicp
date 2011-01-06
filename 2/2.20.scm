#lang planet neil/sicp

(define (filter-list filter items)
  (if (null? items) nil
      (if (filter (car items))
          (cons (car items) (filter-list filter (cdr items)))
          (filter-list filter (cdr items)))))


(define (same-parity i . items)
  (define parity (remainder i 2))
  (define (test? x) (= (remainder x 2) parity))
  (cons i (filter-list test? items)))

 