#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (test)
  (memq 'red '((red shoes) (blue socks))))

(define (test1)
  (memq 'blue '(red shoes blue socks)))