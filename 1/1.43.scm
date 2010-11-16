#lang planet neil/sicp

(define (inc n) (+ 1 n))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f ( repeated f (- n 1)))))

