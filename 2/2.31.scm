#lang planet neil/sicp

(define (sq x) (* x x))

(define test
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree)) (f sub-tree)
             (tree-map f sub-tree))) tree))

(define (square-tree tree)
  (tree-map sq tree))

        