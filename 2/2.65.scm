#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (make-tree entry left right)
  (list entry left right))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))


(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))


(define (tree->list tree)
  (if (null? tree)
      '()
      (append (tree->list (left-branch tree))
              (cons (entry tree)
                    (tree->list (right-branch tree))))))

(define (union-set-list set1 set2)
  (cond ((null? set2) set1)
        ((null? set1) set2)
        (else
         (let ((x1 (car set1))
               (x2 (car set2)))
           (cond ((< x1 x2) (cons x1 (union-set-list (cdr set1) set2)))
                 ((= x1 x2) (cons x1 (union-set-list (cdr set1) (cdr set2))))
                 (else (cons x2 (union-set-list set1 (cdr set2)))))))))

(define (adjoin-set-list x set)
  (cond ((null? set) (cons x '()))
        ((> x (car set)) (cons (car set) (adjoin-set-list x (cdr set))))
        ((= x (car set)) set)
        (else (cons x set))))


(define (union-set set1 set2)
  (list->tree (union-set-list (tree->list set1) (tree->list set2))))