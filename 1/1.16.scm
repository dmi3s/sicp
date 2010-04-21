#lang planet neil/sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-exp b n )
  (define (fast-exp-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-exp-iter (square b) (/ n 2) a))
          (else (fast-exp-iter b (- n 1) (* a b)))))
  (fast-exp-iter b n 1))
                     