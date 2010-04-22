#lang planet neil/sicp

(define (mul-rec a b)
  (if (= b 0)
      0
      (+ a (mul-rec a (- b 1)))))

(define (double n) 
  (+ n n))


(define (half n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (mul-iter a b)
  (define (mul-iter-inner a b r)
    (cond ((= b 0) r)
          ((even? b) (mul-iter-inner (double a) (half b) r))
          (else (mul-iter-inner a (- b 1) (+ r a)))))
  (mul-iter-inner a b 0))