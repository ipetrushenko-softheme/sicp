#lang racket

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (if (> d 0)
        (cons (/ n g) (/ d g))
        (cons (/ (- n) g) (/ (- d) g)))))
        
;(define numer car)
(define (numer rational_number)
  (car rational_number))

(define (denom rational_number)
  (cdr rational_number))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mult-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
