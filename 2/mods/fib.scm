#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(provide fib)

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (define (square n)
    (* n n))
  (cond ((= count 0) b)
         ((even? count)
          (fib-iter a
                    b
                    (+ (square p) (square q))
                    (+ (square q) (* 2 p q ))
                    (/ count 2)))
         (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))
