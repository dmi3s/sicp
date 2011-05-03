#lang scheme
(require "get-put.scm"
         "tag.scm"
         )

(provide apply-generic)

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
           "Where is no method for types -- APPLY-GENERIC"
           (list op type-tags))))))