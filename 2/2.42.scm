#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(require "mods/flatmap.scm")
(require "mods/enumerate-interval.scm")
(require "mods/accumulate.scm")

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter safe?
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position row col rest)
  (append (list (make-pos row col)) rest))
(define empty-board '())
(define (make-pos row col) (list row col))
(define (pos-row pos) (car pos))
(define (eq? pos1 pos2) (and (= (pos-row pos1) (pos-row pos2))
                             (= (pos-col pos1) (pos-col pos2))))

(define (pos-col pos) (cadr pos))

(define (safe-pos? pos1 pos2)
  (let ((r1 (pos-row pos1))
        (r2 (pos-row pos2))
        (c1 (pos-col pos1))
        (c2 (pos-col pos2)))
    (not (or (= r1 r2) (= c1 c2)
             (= (abs (- r1 r2)) (abs (- c1 c2)))))))
  
(define (safe? positions)
  (define (safe-position? pos rest)
    (cond ((empty? rest) true)
          (else (if (safe-pos? pos (car rest))
                    (safe-position? pos (cdr rest))
                    false))))
  (safe-position? (car positions) (cdr positions)))
  
  
(define (test size)
  (length (queens size)))
