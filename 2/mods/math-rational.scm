#lang scheme
(require "get-put.scm" "tag.scm" "math.scm")

(provide install-rational-package)

(define (install-rational-package)
   ;; внутренние процедуры
  (define (gcd a b)
    (if (= b 0) a (gcd b (remainder a b))))
  (define (numer x) (car x))
  (define (denom x) (cdr x))
  (define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
  (define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
  (define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
  (define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))
  (define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))
   ;; интерфейс к остальной системе
  (define (tag x) (attach-tag 'rational x))
  (put 'add '(rational rational)
       (lambda (x y) (tag (add-rat x y))))
  (put 'sub '(rational rational)
       (lambda (x y) (tag (sub-rat x y))))
  (put 'mul '(rational rational)
       (lambda (x y) (tag (mul-rat x y))))
  (put 'div '(rational rational)
       (lambda (x y) (tag (div-rat x y))))
  (put 'make 'rational
       (lambda (n d) (tag (make-rat n d))))
  (put 'equ? '(rational rational)
       (lambda (x y) (eq? (* (numer x) (denom y))
                          (* (denom x) (numer y)))))
  (put '=zero? '(rational)
       (lambda (r) (eq? (numer r) 0)))

  ;; Type conversions
  (define (rational->scheme-number r-tagged)
    (let ((r (contents r-tagged)))
      (make-scheme-number (/ (numer r) (denom r)))))
  (put-coercion 'rational 'scheme-number
                rational->scheme-number)
  
  (define (raise r)
      (make-scheme-number (/ (numer r) (denom r))))
  (put 'raise '(rational) raise)
  
  'done-rational)

