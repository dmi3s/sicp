#lang planet neil/sicp

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
             (iter (next a) (combiner result (term a)))
             (iter (next a) result))))
  (iter a null-value))

(define (accumulate combiner null-value term a next b)
  (define (always x) true)
  (filtered-accumulate combiner null-value term a next b always))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))


(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

                       
(define (inc k) (+ k 1))
(define (identity x) x)
(define (square x) (* x x))    

(define (next n) 
  (if (= n 2) 3 (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))
