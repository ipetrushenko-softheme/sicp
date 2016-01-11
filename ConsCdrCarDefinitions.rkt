#lang racket

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (cons-lambda x y)
  (lambda(z)
    (cond ((= z 0) x)
          ((= z 1) y)
          (else (error "Argument not 0 or 1 -- CONS" z)))))

(define (car z) (z 0))
(define (cdr z) (z 1))
