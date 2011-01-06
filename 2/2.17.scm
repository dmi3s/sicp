#lang planet neil/sicp

(define (last-pair l)
  (let ((tail (cdr l)))
    (if (null? tail)
        l
        (last-pair tail))))

(define test (last-pair (list 23 72 149 34)))
