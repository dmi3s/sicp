#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(require "accumulate.scm")

(provide accumulate-n)
  
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init 
                        (map car seqs))
            (accumulate-n op init
                          (map cdr seqs)))))

