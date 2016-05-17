#lang racket

(define (half x) (/ x 2))
(define (double x) (+ x x))

(define (fast-mult a b)
  (define (iter-mult a b product)
    (cond ((= b 0) product)
          ((even? b) (iter-mult (double a) (half b) product))
          (else      (+ a product (iter-mult a (- b 1) product)))))
  (iter-mult a b 0))
