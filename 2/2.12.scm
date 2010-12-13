#lang planet neil/sicp

(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))

(define (lower-bound i) (car i))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))


(define (make-center-percent c p)
  (make-center-width c (/ (* c p) 100)))

(define (percent i) 
  (/ (* 100 (width i)) (center i)))

(define t (make-center-percent 10 10.0))