#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (draw-contour fr)
  (define lb (frame-origin fr))
  (define lt (vector-add lb (frame-edge2 fr)))
  (define rt (vector-add lt (frame-edge1 fr)))
  (define rb (vector-add lb (frame-edge1 fr)))
  (define segs (list 
                (make-segment lb lt)
                (make-segment lt rt)
                (make-segment rt rb)
                (make-segment rb lb)
                ))
  (segments->painter segs))


(define eps 0.1)

(define fr0
  (make-frame (make-vect 0 0) (make-vect (- 1 eps) 0) (make-vect 0 (- 1 eps))))

(define test-a (paint (draw-contour fr0)))


  