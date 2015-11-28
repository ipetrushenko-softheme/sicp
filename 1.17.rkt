#lang scheme

(define (double x)      (+ x x))
(define (half even_x)   (/ even_x 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-mult (double a) (half b)))
        (else      (+ a (fast-mult a ( - b 1))))))

(define (slow-mult a b)
  (if (= b 0)
      0
      (+ a (slow-mult a (- b 1)))))