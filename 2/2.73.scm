#lang scheme
(require "mods/get-put.scm")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Numbers
(define (=number? exp num)
  (and (number? exp) (= exp num)))

; Variables
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; Sums
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))


(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

; Products
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))

(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-deriv-rules)
  (define (deriv-sum args var)
    (define (addend a) (car a))
    (define (augend a) (cadr a))
    (make-sum (deriv (addend args) var)
              (deriv (augend args) var)))
  
  (define (deriv-product args var)
    (define (multiplier a) (car a))
    (define (multiplicand a) (cadr a))
    (make-sum
     (make-product (multiplier args)
                   (deriv (multiplicand args) var))
     (make-product (deriv (multiplier args) var)
                   (multiplicand args))))
  
  (define (deriv-exp args var)
    (define (base a) (car a))
    (define (exponent a) (cadr a))
    (make-product 
     (make-product (exponent args)
                   (make-exponentiation (base args)
                                        (- (exponent args) 1)))
     (deriv (base args) var)))
  
  (put 'deriv '+ deriv-sum)
  (put 'deriv '* deriv-product)
  (put 'deriv '** deriv-exp)
  'done)
