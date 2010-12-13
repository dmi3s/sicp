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
  (let ((lx (lower-bound x))
        (ly (lower-bound y))
        (ux (upper-bound x))
        (uy (upper-bound y)))
    (cond ((< ux 0)
           (cond ((< uy 0) (make-interval (* ux uy) (* lx ly)))
                 ((< ly 0) (make-interval (* lx uy) (* lx ly)))
                 (else (make-interval (* lx uy) (* ux ly)))))
          ((< lx 0)
           (cond ((< uy 0)
                  (make-interval (* ux ly) (* lx ly)))
                 ((< ly 0)
                  (make-interval (min (* lx uy) (* ux ly))
                                 (max (* lx ly) (* ux uy))))
                 (else (make-interval (* lx uy) (* ux uy)))))
          (else (mul-interval-case y x))))) ; I'm to lazy to continue %)

(define n1 (make-interval -3 -1))
(define n2 (make-interval -6 -2))
(define nz (make-interval -1 1))
(define nzz (make-interval -1 0))
(define np1 (make-interval 1 3))

(define m1 (make-interval -4 5))
(define m2 (make-interval -5 3))
(define m3 (make-interval -2 2))

