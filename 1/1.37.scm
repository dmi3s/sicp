#lang planet neil/sicp

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (if (> i k)
        result
        (cont-frac-iter (+ i 1) (/ (n i) (+ (d i) result)))))
  (cont-frac-iter 1 0))

(define (cont-frac-r n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac-r n d (- k 1))))))

(define (phi k)
  (/ 1 (cont-frac (lambda (i) 1) (lambda (i) 1) k)))
