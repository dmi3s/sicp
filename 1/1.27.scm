#lang planet neil/sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square n) (* n n))

(define (ferma-test n a)
  (define try-it
    (= (expmod a n n) a))
  try-it)

(define (ferma-full-test n a)
  (cond ((= n a) true)
        ((ferma-test n a) (ferma-full-test n (+ a 1)))
        (else false)))

(define (run-ferma-test n)
  (ferma-full-test n 1))

