#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (make-frame-m origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame-mm origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-m fr) (car fr))
(define (edge1-frame-m fr) (cadr fr))
(define (edge2-frame-m fr) (caddr fr))

(define test-m
  (let ((fr (make-frame-m (make-vect 0 0) (make-vect 1 1) (make-vect 2 2))))
    (list (origin-frame-m fr) (edge1-frame-m fr) (edge2-frame-m fr))))

(define (origin-frame-mm fr) (car fr))
(define (edge1-frame-mm fr) (cadr fr))
(define (edge2-frame-mm fr) (cddr fr))

(define test-mm
  (let ((fr (make-frame-mm (make-vect 0 0) (make-vect 1 1) (make-vect 2 2))))
    (list (origin-frame-mm fr) (edge1-frame-mm fr) (edge2-frame-mm fr))))
