#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init 
                        (map car seqs))
            (accumulate-n op init
                          (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mrow) (matrix-*-vector cols mrow) ) 
         m)))

(define v '(1 2 3 4))
(define w '(1 0 0 0))
(define m '((1 2 3 4) (4 5 6 6) (6 7 8 9)))

(define me '((1 0) (0 1)))
(define mm '((1 1) (1 1)))
(define t '((1 2) (3 4)))
  