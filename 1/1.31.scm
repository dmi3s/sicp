#lang planet neil/sicp

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define product product-iter)

(define (factorial n)
  (define (identity x) x)
  (define (inc x) (+ x 1))
  (product identity 1 inc n))

(define (pi n)
  (define (round2 x)
    (- x (remainder x 2)))
  (define (even k)
    (round2 (+ k 2)))
  (define (odd k)
    (+ (round2 (+ k 1)) 1))
  (define (inc k) (+ k 1))
  (/ (* 4 (product even 1 inc n))
     (product odd 1 inc n)))

    
    
