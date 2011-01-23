#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(require "mods/flatmap.scm")
(require "mods/enumerate-interval.scm")
(require "mods/accumulate.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (cons i j)) 
                  (enumerate-interval 1 (- i 1)))) 
           (enumerate-interval 1 n)))

(define (unique-triples n)
  (flatmap (lambda (p) 
             (map (lambda (k)
                    (list (car p) (cdr p) k))
                  (enumerate-interval 1 (- (cdr p) 1))))
           (unique-pairs n)))

(define (unique-triples-sum n s)
  (define (sum-of-triplet tr)
    (accumulate + 0 tr))
  (filter (lambda (tr) (= s (sum-of-triplet tr)))
          (unique-triples n)))