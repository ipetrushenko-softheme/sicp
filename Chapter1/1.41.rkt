#lang racket

(define (inc x) (+ x 1))

(define (double g)
  (lambda(x)
    (g (g x))))

(define answer
   (((double (double double)) inc) 5))