#lang planet neil/sicp

(define (make-rat n d)
  (define sign
    (if (< (* n d) 0) -1 1))
  (let ((an (abs n)) (ad (abs d)))
    (let ((g (gcd an ad)))
      (cons (* sign (/ an g)) (/ ad g)))))

(define (number x) (car x))

(define (denom x) (cdr x))

(define (mul-rat x y)
  (make-rat 
   (* (number x) (number y))
   (* (denom x) (denom y))))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

