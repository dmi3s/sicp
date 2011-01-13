#lang planet neil/sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (mobile? structure)
  (pair? structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((structure (branch-structure branch)))
      (if (mobile? structure)
          (total-weight structure)
          structure)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))
  
(define test
  (make-mobile
   (make-branch 1 2)
   (make-branch 3 4)))

(define test-mob
  (make-mobile
   (make-branch 10
                (make-mobile
                 (make-branch 12 5)
                 (make-branch 33 2)))
   (make-branch 18
                (make-mobile
                 (make-branch 7 3)
                 (make-branch 8 9)))))
