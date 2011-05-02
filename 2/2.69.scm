#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "mods/huffman.scm")
(require "mods/huffman-enc.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (define (merge l)
    (if (null? (cdr l)) l
        (let ((first (car l))
              (second (cadr l))
              (tail (cddr l)))
          (merge (adjoin-set (make-code-tree first second) tail)))))
  (car (merge leaves)))

(define test-tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define test (encode '(A D A B B C A) test-tree))

