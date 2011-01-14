#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(provide filter)

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
