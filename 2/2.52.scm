#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (polyline . vertices)
  (define (pline vlist)
    (if (empty? (cdr vlist))
        '()
        (cons (make-segment (car vlist) (cadr vlist)) (pline (cdr vlist)))))
  (pline vertices))

(define mv make-vect)

(define wave
  (let ((segs (append
               (polyline (mv 0 0.15)    (mv 0.15 0.4)  (mv 0.3 0.35)
                         (mv 0.4 0.35)  (mv 0.35 0.15) (mv 0.4 0))
               (polyline (mv 0.6 0)     (mv 0.65 0.15) (mv 0.6 0.35)
                         (mv 0.75 0.35) (mv 1 0.65))
               (polyline (mv 1 0.85)    (mv 0.6 0.55)  (mv 0.75 1))
               (polyline (mv 0.6 1)     (mv 0.5 0.7)   (mv 0.4 1))
               (polyline (mv 0.25 1)    (mv 0.35 0.5)  (mv 0.3 0.4)
                         (mv 0.15 0.6)  (mv 0 0.35))
               (polyline (mv 0.45 0.15) (mv 0.5 0.18) (mv 0.55 0.15))
               )))
    (segments->painter segs)))

(define (test-a) (paint-hires wave))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (corner-split-mod painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left up)
              (bottom-right right)
              (corner (corner-split-mod painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (test-b) (paint-hires (corner-split-mod wave 2)))
