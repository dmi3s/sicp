#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(provide enumerate-interval)

(define (enumerate-interval i n)
  (if (> i n) '()
      (cons i (enumerate-interval (+ i 1) n))))
