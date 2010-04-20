#lang planet neil/sicp

(define (pas-number ln n)
  (cond ((or (= n 1) (= ln n)) 1)
        ((and (> n 1) (< n ln)) (+ (pas-number (- ln 1) (- n 1))
         (pas-number (- ln 1) n )))))