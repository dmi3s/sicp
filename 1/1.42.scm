#lang planet neil/sicp

(define (inc n) (+ 1 n))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

