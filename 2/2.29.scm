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
; cdr for cons

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))
; cdr for cons

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (mobile? structure)
        (total-weight structure)
        structure)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-moment branch)
  (* (branch-length branch) (branch-weight branch)))

(define (mobile-balanced? mobile)
  (define left (left-branch mobile))
  (define right (right-branch mobile))
  (define (branch-balanced? branch)
    (if (mobile? (branch-structure branch))
        (mobile-balanced? (branch-structure branch))
        't))
  (and (branch-balanced? left)
       (branch-balanced? right)
       (= (branch-moment left) (branch-moment right))))

(define test
  (make-mobile
   (make-branch 10 20)
   (make-branch 20 10)))

(define test-mob
  (make-mobile
   (make-branch 100
                (make-mobile
                 (make-branch 1 2)
                 (make-branch 2 1)))
   (make-branch 1
                (make-mobile
                 (make-branch 100 200)
                 (make-branch 200 100)))))
