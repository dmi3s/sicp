#lang planet neil/sicp

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-rect lt rb)
  (cons lt rb))

(define (lt-rect r)
  (car r))

(define (rb-rect r)
  (cdr r))

(define (width-rect r)
  (- (x-point (rb-rect r)) (x-point (lt-rect r))))

(define (height-rect r)
  (- (y-point (rb-rect r)) (y-point (lt-rect r))))

(define (perimeter-rect r)
  (* 2 (+ (width-rect r) (height-rect r))))

(define (square-rect r)
  (* (width-rect r) (height-rect r)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (test)
  (let ((r (make-rect (make-point 3 4) (make-point 7 10))))
    (display "perimeter= ")
    (display (perimeter-rect r))
    (newline)
    (display "square= ")
    (display (square-rect r))))

