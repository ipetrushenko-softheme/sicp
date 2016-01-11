#lang racket

(define (good-enough? v1 v2)
  (< (abs (- v1 v2)) 0.0001))

(define (average v1 v2)
  (/ (+ v1 v2) 2.0))

(define (cube x) (* x x x))

(define (fixed-point f guess)
  (if (good-enough? guess (f guess))
      guess
      (fixed-point f (f guess))))

(define (sqrt x)
  (fixed-point (lambda(y) (average y (/ x y)))
               1.0))

  
  

