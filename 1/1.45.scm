#lang planet neil/sicp

(define (rootn n x ndamps)
  (define (f y) (/ x (exp y (- n 1))))
  (fixed-point ((repeated average-damp ndamps) f) 1.0))

(define (root n x)
  (let ((ndamps (floor (log2 n))))
    (rootn n x ndamps)))

(define (log2 x)
  (/ (log x) (log 2)))

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (exp b n )
  (define (fast-exp-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-exp-iter (square b) (/ n 2) a))
          (else (fast-exp-iter b (- n 1) (* a b)))))
  (fast-exp-iter b n 1))


(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f ( repeated f (- n 1)))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next) (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


(define (average x y)
  (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))