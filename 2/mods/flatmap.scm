#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(require "accumulate.scm")
(provide flatmap)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
