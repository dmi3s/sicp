#lang planet neil/sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) 
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define test ((two square) 2))

(define (add m n)
  (lambda (f) (lambda(x) ((m f)((n f) x)))))

(define test-add  (((add one one) square) 2))

(display test)
(display "\n")
(display test-add)