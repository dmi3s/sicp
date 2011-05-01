#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (adjoin-set x set)
  (cond ((null? set) (cons x '()))
        ((> x (car set)) (cons (car set) (adjoin-set x (cdr set))))
        ((= x (car set)) set)
        (else (cons x set))))

        
