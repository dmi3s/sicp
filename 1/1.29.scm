#lang planet neil/sicp

(define (sum term a next b)
  (if (> a b) 
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (even? n) (= (remainder n 2) 0))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (coeff k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          (else 4)))
  (define (term k) (* (coeff k) (f (+ a (* k h)))))
  (define (next k) (+ k 1))
  (* (/ h 3) (sum term 0 next n)))

(define (cube x) (* x x x))


    
