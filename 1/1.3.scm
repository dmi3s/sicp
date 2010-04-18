#lang planet neil/sicp

(define (square x) 
  (* x x) )

(define (sum-of-squares x y )
  (+ (square x) (square y)))

(define (sum-of-squres-biggest a b c)
  (cond ((< a b) (sum-of-squres-biggest b a c))
        ((< b c) (sum-of-squres-biggest a c b))
        (else (sum-of-squares a b))))
 