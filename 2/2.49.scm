#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "mods/accumulate.scm")

(define ms make-segment)
(define mv make-vect)

(define draw-contour
  (let ((segs (list
               (ms (mv 0 0) (mv 0 1))
               (ms (mv 0 1) (mv 1 1))
               (ms (mv 1 1) (mv 1 0))
               (ms (mv 1 0) (mv 0 0))
               )))
    (segments->painter segs)))


(define eps 0.1)

(define fr0
  (make-frame (make-vect 0 0) (make-vect (- 1 eps) 0) (make-vect 0 (- 1 eps))))

(define test-a (paint draw-contour))

(define draw-x
  (let ((segs (list
               (ms (mv 0 1) (mv 1 0))
               (ms (mv 0 0) (mv 1 1))
               )))
  (segments->painter segs)))

(define test-b (paint draw-x))

(define draw-diamond
  (let ((segs (list
               (ms (mv 0 0.5) (mv 0.5 1))
               (ms (mv 0.5 1) (mv 1 0.5))
               (ms (mv 1 0.5) (mv 0.5 0))
               (ms (mv 0.5 0) (mv 0 0.5)))))
  (segments->painter segs)))

(define test-c (paint draw-diamond))

(define (polyline vertices)
  (define (iter cur rest result)
    (if (empty? rest)
        result
        (let ((next (car rest)))
          (iter next (cdr rest) (cons (ms cur next) result)))))
  (if (empty? vertices)
      '()
      (iter (car vertices) (cdr vertices) '())))

(define (contour vertices)
  (let ((line-segments (polyline vertices)))
    (if (empty? line-segments)
        '()
        (cons (ms (cdar line-segments) (car vertices)) line-segments))))

(define (test-contour)
  (paint (segments->painter (contour (list (mv 0 0) (mv 0 1) (mv 1 0))))))
