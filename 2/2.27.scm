#lang planet neil/sicp

(define (reverse l)
  (define (reverse-iter list result)
    (if (null? list)
        result
        (reverse-iter (cdr list) (cons (car list) result))))
  (reverse-iter l nil))


(define (deep-reverse l)
  (define (leaf? x) (not (pair? x)))
  (define (iter list result)
    (if (null? list)
        result
        (let ((head (car list))
              (tail (cdr list)))
          (if (leaf? head)
              (iter tail (cons head result))
              (iter tail (cons (iter head nil) result))))))
  (iter l nil))


(define l (list (list 1 2) (list 3 4) 5))