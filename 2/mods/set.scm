#lang scheme

(provide exists-set?
         make-set
         add-set
         remove-set)

(define (exists-set? x set)
  (cond ((null? set) false)
        ((eq? x (car set)) true)
        (else (exists-set? x (cdr set)))))

(define (add-set x set)
  (if (not (exists-set? x set))
           (cons x set)
           set))

(define (remove-set x set)
  (define (remove x head rest)
    (let ((rs (car rest))
          (new-rest (cdr rest)))
          (if (eq? x rs) (append head new-rest)
              (remove x (cons rs head) new-rest))))
  (remove x '() set))

(define (make-set list)
  (define (make-int set rest)
    (if (null? rest) set
        (make-int (add-set (car rest) set) (cdr rest))))
  (make-int '() list))

