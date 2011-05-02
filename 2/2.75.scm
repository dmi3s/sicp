#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'angle) a)
          ((eq? op 'magnitude) r)
          ((eq? op 'real-part) (* r (cos a)))
          ((eq? op 'imag-part) (* r (sin a)))
          (else (error "Unknown operation -- make-from-mag-ang" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

(define z (make-from-mag-ang 10 0.5))

(define test (apply-generic 'angle z))
           