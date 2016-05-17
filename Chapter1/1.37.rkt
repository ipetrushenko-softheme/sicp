#lang racket

(define (cond-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0.0))

(define (cond-frac-rec n d k)
  (define (frac-rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (frac-rec (+ i 1))))))
  (frac-rec 1))

       
(define (fixed-point f x)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
    (if (close-enough? guess next)
        next
        (try next))))
  (try x))

(define golden-rat
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

(define golden-ratio
  (cond-frac (lambda(i) 1.0)
                 (lambda(i) 1.0)
                 500))