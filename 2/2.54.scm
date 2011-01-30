#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))


(define li1 '(a (b c) d e))
(define li2 '(a (b c) d e))
(define li3 '(a (b c) (d e)))

(define (equal-m? l1 l2)
  (define (eq-not-null? e1 e2)
    (if (pair? e1)
        (if (pair? e2) 
            (equal-m? e1 e2) 
            false)
        (if (not (pair? e2)) 
            (eq? e1 e2) 
            false)))
  (cond ((null? l1) (null? l2))
        ((null? l2) false)
        (else (if (eq-not-null? (car l1) (car l2))
              (equal-m? (cdr l1) (cdr l2))
              false))))

