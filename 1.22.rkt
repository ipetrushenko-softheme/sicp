#lang racket

(define (square x) (* x x))
(define (runtime) (current-inexact-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start_time)
  (cond ((prime? n) (display n)(report-prime (- (runtime) start_time)))
        (else false)))
        
(define (report-prime elapsed_time)
  (display " - prime (")
  (display elapsed_time)
  (display "ms)")
  (newline))

(define (prime? n)
   (= (smallest-divisor n) n))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n guess)
  (cond ((> (square guess) n) n)
        ((divides? n guess) guess)
        (else (find-divisor n (next guess)))))

(define (next a)
  (if (= a 2)
      3
      (+ a 2)))

(define (divides? a b)
  (= (remainder a b) 0))
      
(define (search-for-primes from to)
   (cond ((> from to) false)
         ((<= from 3)   (timed-prime-test from) (search-for-primes (+ 1 from) to))
         ((prime? from) (timed-prime-test from) (search-for-primes (+ 2 from) to))
         (else          (search-for-primes (+ 1 from) to))))

(define (x-smallest-primes-larger-than-n n x)
  (cond ((< x 0) false) 
        ((timed-prime-test n) (x-smallest-primes-larger-than-n (+ n 1) (- x 1)))
        (else                 (x-smallest-primes-larger-than-n (+ n 1) x))))



