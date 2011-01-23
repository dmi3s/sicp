#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define make-segment-m cons)
(define start-segment-m car)
(define end-segment-m cdr)

(define test
  (let ((s (make-segment-m (make-vect 1 1) (make-vect 2 2))))
    (vector-add (start-segment-m s) (end-segment-m s))))
