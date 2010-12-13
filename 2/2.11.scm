#lang planet neil/sicp

(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (max (cdr i) (car i)))

(define (lower-bound i)
  (min (cdr i) (car i)))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (mul-interval-case x y)
  (cond ((< (upper-bound x) 0)
         (cond ((< (upper-bound y) 0)
                (make-interval (* (upper-bound x) (upper-bound y))
                               (* (lower-bound x) (lower-bound y))))
               ((< (lower-bound y) 0)
                (make-interval (* (lower-bound x) (upper-bound y))
                               (* (lower-bound x) (lower-bound y))))
               (else
                (make-interval (* (lower-bound x) (upper-bound y))
                             (* (upper-bound x) (lower-bound y))))))
        ((< (lower-bound x) 0)
         (cond ((< (upper-bound y) 0)
                (make-interval (* (upper-bound x) (lower-bound y))
                               (* (lower-bound x) (lower-bound y))))
               ((< (lower-bound y) 0)
                (make-interval (min (* (lower-bound x) (upper-bound y))
                                    (* (upper-bound x) (lower-bound y)))
                               (max (* (lower-bound x) (lower-bound y))
                                    (* (upper-bound x) (upper-bound y)))))))
         
        (else (make-interval 0 0))))


(define n1 (make-interval -3 -1))
(define n2 (make-interval -6 -2))
(define nz (make-interval -1 1))
(define nzz (make-interval -1 0))
(define np1 (make-interval 1 3))

(define m1 (make-interval -4 5))
(define m2 (make-interval -5 3))
(define m3 (make-interval -2 2))

