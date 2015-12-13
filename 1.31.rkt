#lang racket

(define (product a b term next)
  (if (> a b)
      1
      (* (term a)
         (product (next a) b term next))))

(define (product-iter a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))


 (define (identity x) x) 
  
 (define (next x) (+ x 1)) 
  
 (define (factorial n) 
 (product 1 n identity next))