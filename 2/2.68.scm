#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "mods/huffman.scm")

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (contains? el list)
  (not (null? (filter (lambda (e) (equal? el e)) list))))

(define (encode-symbol s tree)
  (define (encode t)
    (cond ((null? t) (error "Can't find branch for" s))
          ((leaf? t) (if (contains? s (symbols t)) '() (error "Can't find branch for " s)))
          ((contains? s (symbols (left-branch t))) (cons '0 (encode (left-branch t))))
          (else (cons '1 (encode (right-branch t))))))
  (encode tree))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                    (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define test (encode '(A D A B B C A) sample-tree))