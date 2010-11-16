#lang planet neil/sicp

(define (inc n) (+ 1 n))

(define (double f) (lambda (x) (f (f x))))

(define (e f) ((double (double double)) f))