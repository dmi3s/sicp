#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (transform-painter-m painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (vector-sub (m corner1) new-origin)
                     (vector-sub (m corner2) new-origin)))))))

(define (flip-horiz-m painter)
  (transform-painter-m painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))


(define test-hor
  (paint (flip-horiz einstein)))

(define (rot-ccw-180 painter)
  (transform-painter-m painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rot-ccw-270 painter)
  (transform-painter-m painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

