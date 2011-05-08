#lang scheme
(require "mods/math.scm"
         "mods/math-install.scm"
         rackunit
         rackunit/text-ui
         )

(install-math)

(define raise-tests
  (test-suite "Test raise functionality"
              
   (test-case "Raise of rational"
              (define r (make-rational 1 7))
              (check-equal? (raise r) (make-scheme-number (/ 1 7))))
   
   (test-case "Double raise of rational"
              (define r (make-rational 1 3))
              (let ((double-raised-value (raise (raise r))))
                (check-equal? (real-part double-raised-value) (/ 1 3))
                (check-equal? (imag-part double-raised-value) 0)))
   
   (test-case "Raise of complex should fail"
              (define c (make-complex-from-real-imag 1 1))
              (check-exn exn:fail? (lambda ()(raise c))))
   ))

(run-tests raise-tests)
