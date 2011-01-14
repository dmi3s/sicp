#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(require "mods/flatmap.scm")
(require "mods/prime.scm")
(require "mods/enumerate-interval.scm")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (cons i j)) 
                  (enumerate-interval 1 (- i 1)))) 
           (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (define (pair-sum pair) (+ (car pair) (cdr pair)))
  (define (prime-sum? pair) (prime? (pair-sum pair)))
  (define (make-pair-sum-pair pair)
    (list (car pair) (cdr pair) (pair-sum pair)))
  (map make-pair-sum-pair 
       (filter prime-sum? (unique-pairs n))))
