#lang scheme

(define (double x)      (+ x x))
(define (half even_x)   (/ even_x 2))

(define (fast-mult a b)
  (cond ((= b 0) a)
        ((even? b) (mult (double a) (half b)))
        (else      (+ a (mult a ( - b 1))))))

(define (slow-mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))