#lang scheme
(require "mods/math.scm"
         "mods/math-install.scm"
         )

(install-math)

(define r (make-rational 1 2))

(define (test)
  (raise (raise r)))

