#lang planet neil/sicp

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next n) 
  (if (= n 2) 3 (+ n 2)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes-not-even a b)
  (cond ((< a b) (timed-prime-test a) (search-for-primes-not-even (+ a 2) b))))

(define (search-for-primes a b)
  (if (even? a) (search-for-primes-not-even (+ a 1) b) 
      (search-for-primes-not-even a b)))
  
; 100003 *** 145 (269)
; 100019 *** 145 (408)
; 100043 *** 145 (250)
