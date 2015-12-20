#lang racket

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2.0))

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f x count)
  (cond ((close-enough? x (f x)) x)
        (else (display x)
              (display "-")
              (display (f x))
              (display "--")
              (display count)
              (newline)
              (fixed-point f (f x) (+ 1 count)))))

(define (x-to-the-x y)
  (fixed-point (lambda(x) (average x (/ (log y) (log x))))
               2.0
                 1))