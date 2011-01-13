#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ y x)) 0 
              (map (lambda (e) (if (not (pair? e)) 1 (count-leaves e))) t)))

(define test
  (list 1
        (list 2 3
              (list 4)
              5)
        6
        7))