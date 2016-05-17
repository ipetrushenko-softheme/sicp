#lang scheme

(define (average x y)
  (/ (+ x y) 2.0))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough-iter? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.0001))

(define (good-enough-rec? guess x)
  (< (abs (- (square guess) x)) 0.0001))

(define (sqrt-rec x guess)
  (if (good-enough-rec? guess x)
      guess
      (sqrt-rec x (improve guess x))))

(define (sqrt-iter guess prev-guess x)
  (if (good-enough-iter? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
                 guess
                 x)))

(define (sqrt x)
 (sqrt-iter 1.0 0.0 x))