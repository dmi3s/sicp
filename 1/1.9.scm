#lang planet neil/sicp

(define (add-rec a b)
  (if (= a 0)
      b
      (inc (add-rec (dec a) b))))

(define (add-iter a b)
  (if (= a 0)
      b
      (add-iter (dec a) (inc b))))

