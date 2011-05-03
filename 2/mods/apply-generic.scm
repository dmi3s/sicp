#lang scheme
(require "get-put.scm"
         "tag.scm"
         )

(provide apply-generic)

(define (apply-generic op . args)
  (display "APPLAY-GENERIC: ")
  (print (list args))
  (display "\n")
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (if (= (length args) 2)
               (let ((type1 (car type-tags))
                     (type2 (cadr type-tags))
                     (a1 (car args))
                     (a2 (cadr args)))
                 (if (not (equal? type1 type2))
                     (let ((t1->t2 (get-coercion type1 type2))
                           (t2->t1 (get-coercion type2 type1)))
                       (cond (t1->t2
                              (apply-generic op (t1->t2 a1) a2))
                             (t2->t1
                              (apply-generic op a1 (t2->t1 a2)))
                             (else
                              (error "Нет метода для этих типов"
                                     (list op type-tags)))))
                     (error "Нет метода для этих типов"
                      (list op type-tags))
                     ))
               (error "Нет метода для этих типов"
                      (list op type-tags)))))))

