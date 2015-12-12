#lang racket

(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum a b next term)
  (if (> a b)
      0
      (+ (term a)
         (sum (next a) b next term))))

(define (sum-int a b)
  (sum a b inc identity))

(define (sum-iter a b next term)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (sum-i a b)
  (sum-iter a b inc identity))