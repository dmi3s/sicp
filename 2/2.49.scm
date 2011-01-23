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
  (if (empty? (cdr vertices))
      '()
      (cons (ms (car vertices) (cadr vertices)) (polyline (cdr vertices)))))

(define (contour vertices)
  (polyline (append vertices (list (car vertices)))))

(define (test-contour)
  (paint (segments->painter (contour (list (mv 0 0) (mv 0 1) (mv 1 0))))))

(define wave
  (let ((segs (append
               (polyline (list
                          (make-vect 0 0.15)
                          (make-vect 0.15 0.4)
                          (make-vect 0.3 0.35)
                          (make-vect 0.4 0.35)
                          (make-vect 0.35 0.15)
                          (make-vect 0.4 0)))
               (polyline (list
                          (make-vect 0.6 0)
                          (make-vect 0.65 0.15)
                          (make-vect 0.6 0.35)
                          (make-vect 0.75 0.35)
                          (make-vect 1 0.65)))
               (polyline (list
                          (make-vect 1 0.85)
                          (make-vect 0.6 0.55)
                          (make-vect 0.75 1)))
               (polyline (list
                          (make-vect 0.6 1)
                          (make-vect 0.5 0.7)
                          (make-vect 0.4 1)))
               (polyline (list 
                          (make-vect 0.25 1)
                          (make-vect 0.35 0.5)
                          (make-vect 0.3 0.4)
                          (make-vect 0.15 0.6)
                          (make-vect 0 0.35))))))
    (segments->painter segs)))


(define (test-d)
  (paint-hires (flip-vert wave)))
