#lang planet neil/sicp

(define (iterative-improve good-enough? improve)
  (define (iteration guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (iteration next))))
  iteration)

(define (average x y)
  (/ (+ x y) 2))

(define (square x) 
  (* x x) )

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt x)
  ((iterative-improve
   (lambda (guess next) (good-enough? guess x))
   (lambda (guess) (improve guess x))) 1.0))


(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve close-enough? f) first-guess))

(define (phi x) 
  (+ 1 (/ 1 x)))
