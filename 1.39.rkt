#lang racket
(define (cont-frac n d k)
  (define (frac-rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (frac-rec (+ i 1))))))
  (frac-rec 1))

(define (square x) (* x x))

(define (tan-cf x k)
  (cont-frac (lambda(i)
               (if (= i 1)
                   x
                   (- (square x))))
             (lambda(i) (- (* i 2) 1))
             k))