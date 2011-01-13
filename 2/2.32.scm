#lang planet neil/sicp

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (subs) (cons (car s) subs)) rest)))))
        