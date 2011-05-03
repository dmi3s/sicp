#lang scheme

(provide attach-tag type-tag contents)

(define (attach-tag type-tag contents)
  (if (eq? type-tag 'scheme-number)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)
        (else (error "Incorrect taged data -- TYPE-TAG" datum))))

(define (contents datum)
  (cond ((pair? datum) datum)
        ((number? datum) datum)
        (else (error "Incorrect taged data -- CONTENTS" datum))))
