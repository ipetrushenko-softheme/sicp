#lang racket

(define (composition f g)
  (lambda(x)
    (f (g x))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define answer
  ((compose square inc) 6))

