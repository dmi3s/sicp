#lang planet neil/sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval i n)
  (if (> i n) '()
      (cons i (enumerate-interval (+ i 1) n))))

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (cons i j)) 
                  (enumerate-interval 1 (- i 1)))) 
           (enumerate-interval 1 n)))



(define (find-divisor n test-divisor)
  (define (next n)  
    (if (= n 2) 3 (+ n 2)))
  (define (square x) (* x x))    
  (define (divides? a b)
    (= (remainder b a) 0))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))



(define (prime-sum-pairs n)
  (define (pair-sum pair) (+ (car pair) (cdr pair)))
  (define (prime-sum? pair) (prime? (pair-sum pair)))
  (define (make-pair-sum-pair pair)
    (list (car pair) (cdr pair) (pair-sum pair)))
  (map make-pair-sum-pair 
       (filter prime-sum? (unique-pairs n))))
