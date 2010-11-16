#lang planet neil/sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess damping)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display (+ 0.0 next))(newline)
      (if (close-enough? guess next)
          next
          (try (damping guess next)))))
  (try first-guess))

(define (f x)
  (/ (log 1000) (log x)))

(define (next-damping guess next) 
  next)

(define (avg-damping guess next)
  (/ (+ guess next) 2))