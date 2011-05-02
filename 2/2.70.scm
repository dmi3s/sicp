#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                     (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "плохой бит -- CHOOSE-BRANCH" bit))))

;(define sample-tree
;  (make-code-tree (make-leaf 'A 4)
;                  (make-code-tree
;                   (make-leaf 'B 2)
;                   (make-code-tree (make-leaf 'D 1)
;                                    (make-leaf 'C 1)))))


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

;(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

;(define test (encode '(A D A B B C A) sample-tree))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaves)
  (define (merge l)
    (if (null? (cdr l)) (car l)
        (let ((first (car l))
              (second (cadr l))
              (tail (cddr l)))
          (merge (adjoin-set (make-code-tree first second) tail)))))
  (merge leaves))

(define rock-tree (generate-huffman-tree
                   '((BOOM 1) (A 2) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1))))

(define rock-song '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))
