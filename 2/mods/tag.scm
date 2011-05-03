#lang scheme

(provide attach-tag type-tag contents)

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Incorrect taged data -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Incorrect taged data -- CONTENTS" datum)))
