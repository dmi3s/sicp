#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(require "huffman.scm")

(provide encode)

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
