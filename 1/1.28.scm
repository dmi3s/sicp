#lang planet neil/sicp

;http://sicp.sergeykhenkin.com/2007/10/15/sicp-exercise-solution-1-28/    comment from thror

(define (square x)
  (* x x))

(define (sqrmod x m)
  (let ((y (remainder (square x) m)))
    (if (and (= y 1) (not (= x 1)) (not (= x (- m 1))))
        0
        y)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (sqrmod (expmod base (/ exp 2) m) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (witness? a n)
  (not (= (expmod a (- n 1) n) 1)))

(define (miller-rabin-test n)
  (not (witness? (+ 1 (random (- n 1))) n)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))
