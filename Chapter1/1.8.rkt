#lang racket

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (good-enough? a b)
  (< (abs (- a (cube b))) 0.0001))

(define (improve x guess)
  (/ ( + (/ x (square guess))
         (* 2 guess))
     3))

(define (sqrt-iter x guess)
  (if (good-enough? x guess)
      guess
      (sqrt-iter x
                 (improve x guess))))

                 
