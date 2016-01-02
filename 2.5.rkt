#lang racket

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (cdr n)
  (find n 3 0))

(define (car n)
  (find n 2 0))

(define (find n d result)
  (cond ((= (remainder n d) 0) (find (/ n d) d (+ result 1)))
         (else result)))
