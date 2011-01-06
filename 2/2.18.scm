#lang planet neil/sicp

(define (reverse l)
  (define (reverse-iter list result)
    (if (null? list)
        result
        (reverse-iter (cdr list) (cons (car list) result))))
  (reverse-iter l nil))

  
(define test (reverse (list 1 4 9 16 25)))