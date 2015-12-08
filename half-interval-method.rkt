#lang racket
(define f
  (lambda(x) (- (* x x) 3)))

(define (close-enough? a b)
  (< (abs (- a b)) 0.0001))

(define (average a b)
  (/ (+ a b) 2.0))

(define (search f neg-point pos-point)
  (let ((mid-point (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        mid-point
        (let ((test-value (f mid-point)))
          (cond ((negative? test-value) (search f mid-point pos-point))
                ((positive? test-value) (search f neg-point mid-point))
                (else mid-point))))))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
          (search f a b))
          ((and (negative? b-value) (positive? a-value))
          (search f b a))
          (else (error "Values are not of opposite sign" a b)))))

           
