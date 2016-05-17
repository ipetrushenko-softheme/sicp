#lang racket

(define (sum-generic a b term next)
  (if (> a b)
      0
      (+ (term a)
         (sum-generic (next a) b term next))))

(define (product-generic a b term next)
  (if (> a b)
      1
      (* (term a)
         (product-generic (next a) b term next))))

(define (accumulate combiner null-value a b term next)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner
                            null-value
                            (next a)
                            b
                            term
                            next))))

(define (accumulate-iter combiner null-value a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;example
(define (combiner a b) (+ a b))
(define (inc a) (+ a 1))
(define (identity x) x)

(define (sum-new a b)
  (accumulate-iter combiner 0 a b identity inc)) 