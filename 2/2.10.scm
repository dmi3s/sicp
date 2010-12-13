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

(define (div-interval x y)
  (if (> (* (upper-bound y) (lower-bound y)) 0)
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))
                    (error "deviding by 0")))

(define i1 (make-interval 1 3))
(define i2 (make-interval 2 6))
(define iz1 (make-interval -3 1))
(define iz2 (make-interval -2 2))