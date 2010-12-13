#lang planet neil/sicp

(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (max (cdr i) (car i)))

(define (lower-bound i)
  (min (cdr i) (car i)))

(define (sub-interval-wrong x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval
    (- (lower-bound x) (upper-bound y))
    (- (upper-bound x) (lower-bound y))))
