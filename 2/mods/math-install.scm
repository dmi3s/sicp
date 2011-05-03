#lang scheme
(require "math-scheme-number.scm"
         "math-rational.scm"
         "math-complex.scm"
         "math-complex-rectangular.scm"
         "math-complex-polar.scm"
         "math-coercion.scm"
         )

(provide install-math)

(define (install-math)
  (install-scheme-number-package)
  (install-rational-package)
  (install-complex-package)
  (install-rectangular-package)
  (install-polar-package)
  (install-math-coercion)
  'done-install-math)
