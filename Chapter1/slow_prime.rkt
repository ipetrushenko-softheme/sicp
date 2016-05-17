#lang racket

(define (square x) (* x x))

(define (divisible? a b)
  (= (remainder a b) 0))

(define (find-divisor n test)
  (cond ((> (square test) n) n)
        ((divisible? n test) test)
        (else (find-divisor n (+ test 1)))))
  
(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= (smallest-divisor n) n))
