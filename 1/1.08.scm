#lang planet neil/sicp

(define (average x y)
  (/ (+ x y) 2))

(define (square x) 
  (* x x) )

(define (good-enough? guess prev-guess)
  (< 
   (abs (/ (- guess prev-guess) guess))
   0.001))

(define (improve y x)
  (/ (+ (/ x (square y)) (* 2 y))
     3))

(define (cube-root-iter guess prev-guess x)
 (if (good-enough? guess prev-guess)
         guess
         (cube-root-iter (improve guess x) guess
                    x)))

(define (cube-root x)
  (cube-root-iter 1 x x))

(define (cube x) (* x x x))