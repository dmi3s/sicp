#lang scheme
(require "get-put.scm"
         "tag.scm"
         "set.scm"
         )

(provide apply-generic)

(define (try-apply-args op args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc (cons true (apply proc (map contents args)))
          (cons false '())))))


(define (try-apply op args type-set)
  (define (converted? r)
    (cond ((null? r) true)
          ((car r) (converted? (cdr r)))
          (else false)))
  (define (convert arg type)
    (if (eq? (type-tag arg) type) arg
        (let ((proc (get-coercion (type-tag arg) type)))
          (if proc (apply proc (list arg))
              false))))
  (define (convert-to type)
    (let ((new-args (map (lambda (a) (convert a type)) args)))
      (if (converted? new-args) (cons true new-args)
          (cons false '()))))
  (define (try-apply-type type)
    (let ((convertion-result (convert-to type)))
      (if (car convertion-result)
          (let ((new-args (cdr convertion-result)))
            (try-apply-args op new-args))
          (cons false '()))))
  ; return (cons ok op-result)
  (if (null? type-set) (cons false '())
      (let ((coersion-type (car type-set)))
        (let ((result (try-apply-type coersion-type)))
          (if (car result) result
              (try-apply op args (cdr type-set)))))))

(define (apply-with-coercion op args)
  ; return (cons ok op-result)
  (let ((type-tags (map type-tag args)))
    (let ((type-set (make-set type-tags)))
;      (display "APPLY WITH COERCION: ") (display type-tags) (display type-set)
      (try-apply op args type-set))))

(define (apply-generic op . args)
;  (display "APPLAY-GENERIC: ") (display (list op args)) (display "\n")
  (let ((r (try-apply-args op args)))
    (if (car r) (cdr r)
        (let ((cr (apply-with-coercion op args)))
          (if (car cr) (cdr cr)
              (error "APPLY-GENERIC: fail to find proc " op args))))))

