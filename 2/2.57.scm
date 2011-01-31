#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
 
; Numbers
(define (=number? exp num)
  (and (number? exp) (= exp num)))

; Variables
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; Sums
(define (make-sum-lst lst)
  (if (null? (cdr lst))
      (car lst)
      (cons '+ lst)))

(define (make-sum a1 . args)
  (define (simplify lst sum result)
    (cond ((null? lst) (if (eq? sum 0) result (cons sum result)))
          ((number? (car lst)) (simplify (cdr lst) (+ sum (car lst)) result))
          ; Expand internal sums
          ((sum? (car lst)) (simplify (append (cdar lst) (cdr lst)) sum result))
          (else (simplify (cdr lst) sum (append result (list (car lst))))))) ; use (append(list)) to save order
  (let ((terms (simplify (cons a1 args) 0 '())))
    (make-sum-lst terms)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) 
  (make-sum-lst (cddr s)))

; Products
(define (make-prod-lst lst)
  (if (null? (cdr lst))
      (car lst)
      (cons '* lst)))

(define (make-product m1 . args)
  (define (simplify lst prod result)
    (cond ((null? lst) ;(if (eq? prod 1) result (cons prod result)))
           (cond ((eq? prod 0) '(0))
                 ((eq? prod 1) result)
                 (else (cons prod result))))
          ((number? (car lst)) (simplify (cdr lst) (* prod (car lst)) result))
          ; Expand internal products
          ((product? (car lst)) (simplify (append (cdar lst) (cdr lst)) prod result))
          (else (simplify (cdr lst) prod (append result (list (car lst))))))) ; use (append(list)) to save order
  (let ((terms (simplify (cons m1 args) 1 '())))
    (make-prod-lst terms)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p)
  (make-prod-lst (cddr p)))

; Exps
(define (make-exponentiation u n)
  (cond ((=number? n 0) 1)
        ((=number? n 1) u)
        ((number? u) (power u n))
        (else (list '** u n))))

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (power a b) (exp (* b (log a))))

; Derivative
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product 
          (make-product (exponent exp)
                        (make-exponentiation (base exp)
                                             (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else
         (error "unknow expression -- DERIV" exp))))

