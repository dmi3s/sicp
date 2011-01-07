#lang planet neil/sicp

(define (sqr x) (* x x))

(define (square-list1 items)
  (if (null? items)
      nil
      (cons (sqr (car items)) (square-list (cdr items)))))


(define (square-list items)
  (map (lambda (x) (* x x)) items))
