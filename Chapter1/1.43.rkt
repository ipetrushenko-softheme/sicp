#lang racket

(define (composition f g)
  (lambda(x)
    (f (g x))))

(define (repeated f x)
  (if (= x 1)
      f
      (composition f (repeated f (- x 1)))))

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define answer
  ((repeated square 2) 5))