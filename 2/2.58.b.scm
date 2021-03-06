#lang scheme
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

; Numbers
(define (=number? exp num)
  (and (number? exp) (= exp num)))

; Variables
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; Helpers
(define (omit-parenthesis e)
  (if (null? (cdr e))
      (car e)
      e))

(define (split-by x e)
  (define (split-int l r)
    (cond ((null? r) null)
          ((eq? (car r) x)
           (list l (cdr r)))
          (else (split-int (append l (list (car r)))
                           (cdr r)))))
  (split-int '() e))

; Sums
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (sum? x)
  (and (pair? x) 
       (not (null? (split-by '+ x)))))

(define (addend s) (omit-parenthesis (car (split-by '+ s))))

(define (augend s) (omit-parenthesis (cadr (split-by '+ s))))

; Products
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

(define (product? x)
  (and (pair? x) 
       (not (sum? x))
       (not (null? (split-by '* x)))))

(define (multiplier p) (omit-parenthesis (car (split-by '* p))))

(define (multiplicand p) (omit-parenthesis (cadr (split-by '* p))))

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
        (else
         (error "unknow expression -- DERIV" exp))))
