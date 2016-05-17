#lang racket

(define (square x) (* x x))

(define (square-sum x y)
  (+ (square x)
     (square y)))

(define (largest x y)
  (if (> x y)
      x
      y))

(define (largest-two-square-sum a b c)
  (if (= a (largest a b))
      (square-sum a (largest b c))
      (square-sum b (largest a c))))
      