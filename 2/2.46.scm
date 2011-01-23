#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (make-vect-m x y) (cons x y))
(define (xcor-vect-m v) (car v))
(define (ycor-vect-m v) (cdr v))

(define (add-vect-m v1 v2)
  (make-vect-m
   (+ (xcor-vect-m v1) (xcor-vect-m v2))
   (+ (ycor-vect-m v1) (ycor-vect-m v2))))

(define (sub-vect-m v1 v2)
  (make-vect-m
   (- (xcor-vect-m v1) (xcor-vect-m v2))
   (- (ycor-vect-m v1) (ycor-vect-m v2))))

(define (scale-vect-m s v)
  (make-vect-m
   (* s (xcor-vect-m v))
   (* s (ycor-vect-m v))))

(define test
  (let ((v1 (make-vect-m 2 3))
        (v2 (make-vect-m 5 6)))
    (scale-vect-m 2 (sub-vect-m v2 v1))))
