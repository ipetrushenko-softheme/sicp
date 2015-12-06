#lang racket

(define (square x) (* x x))
(define (runtime) (current-milliseconds))

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
   (= (smallest-divisible n) n))

(define (smallest-divisible n)
  (find-divisible n 2))

(define (find-divisible n guess)
  (cond ((> (square guess) n) n)
        ((divisible? n guess) guess)
        (else (find-divisible n (+ 1 guess)))))

(define (divisible? n guess)
  (= (remainder n guess) 0))

(define (even? n)
  (= (remainder n 2) 0))
      
(define (search_for_primess from to)
   (cond ((> from to) false)
         ((<= from 3)   (timed-prime-test from) (search_for_primess (+ 1 from) to))
         ((prime? from) (timed-prime-test from) (search_for_primess (+ 2 from) to))
         (else          (search_for_primess (+ 1 from) to))))      
