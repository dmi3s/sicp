#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "mods/huffman.scm")
(require "mods/huffman-enc.scm")

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (define (merge l)
    (if (null? (cdr l)) (car l)
        (let ((first (car l))
              (second (cadr l))
              (tail (cddr l)))
          (merge (adjoin-set (make-code-tree first second) tail)))))
  (merge leaves))

(define rock-tree (generate-huffman-tree
                   '((BOOM 1) (A 2) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1))))

(define rock-song '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))
