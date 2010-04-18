#lang planet neil/sicp

(define (a x y)
 (cond ((= y 0) 0)
       ((= x 0) (* 2 y))
       ((= y 1) 2)
       (else (a (- x 1)
                (a x (- y 1))))))

;; 2*n
(define (f n) (a 0 n))

;; 2^n
(define (g n) (a 1 n))

;; 2^2^2...[n-th times]
(define (h n) (a 2 n))