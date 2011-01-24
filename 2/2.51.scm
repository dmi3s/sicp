#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (below-m painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-below
           (transform-painter (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-above
           (transform-painter split-point
                              (make-vect 1.0 (vector-ycor split-point))
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        ((paint-below painter1) frame)
         ((paint-above painter2) frame)))))

(define (below-b painter1 painter2)
  (rotate90
   (beside (rotate270 painter1) (rotate270 painter2))))


(define test (paint-hires (below-m mark-of-zorro einstein)))
(define testb (paint-hires (below-b mark-of-zorro einstein)))
