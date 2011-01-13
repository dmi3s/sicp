#lang planet neil/sicp

(define (sq x) (* x x))

(define (square-list l)
  (map (lambda (sub-l)
         (if (pair? sub-l) (square-list sub-l)
             (sq sub-l))) l ))

(define (square-list-direct l)
  (cond ((null? l) nil)
        ((not (pair? l)) (sq l))
        (else (cons (square-list-direct (car l))
               (square-list-direct (cdr l))))))

(define test
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

