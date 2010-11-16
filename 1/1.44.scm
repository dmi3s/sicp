#lang planet neil/sicp

(define (inc n) (+ 1 n))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f ( repeated f (- n 1)))))

(define (smooth f dx)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (average a b c) (/ (+ a b c) 3))

(define (n-fold-smooth f dx n) 
  (repeated (smooth f dx) n))

(define (smooth-n f dx n)
  ((repeated (lambda (g) (smooth g dx)) n) f))

(define pi 3.1415926)

(define (impulse-maker a y)
  (lambda (x)
    (if (= x a)
        y
        0)))

(define my-impulse-function
  (impulse-maker 0 6))

