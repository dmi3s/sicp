#lang planet neil/sicp

(define (fringe-1 list)
  (define (leaf? x) (not (pair? x)))
  (define (iter l r)
    (if (null? l)
        r
        (let ((head (car l))
              (tail (cdr l)))
          (if (leaf? head)
              (iter tail (cons head r))
              (iter tail (iter head r))))))
  (reverse (iter list nil)))
          

(define (fringe t)
  (cond ((null? t) nil)
        ((pair? t) (append (fringe (car t))
                           (fringe (cdr t))))
        (else (list t))))
         

(define l (list (list 1 2) (list 3 4)))
