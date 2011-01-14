#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(provide accumulate)
  
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
