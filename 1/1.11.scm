#lang planet neil/sicp

(define (fr n)
  (cond ((< n 3) n)
        (else (+ (fr (- n 1)) 
                 (* 2 (fr (- n 2)))
                 (* 3 (fr (- n 3)))))))

(define (fi n)
  (define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (f-iter 2 1 0 n))