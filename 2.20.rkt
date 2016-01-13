#lang racket

(define (same-parity x . z)
  (if (= (remainder x 2) 0)
      (create (cons x z) 0)
      (create (cons x z) 1)))

(define (create items isEven?)
  (cond ((null? items) '())
        ((= (remainder (car items) 2) isEven?) (cons (car items) (create (cdr items) isEven?)))
        (else (create (cdr items) isEven?))))


(define (same-parity-second elem . others)
  (define (same-parity-filter-list items)
    (cond ((null? items) '())
          ((same-parity? elem (car items)) (cons (car items) (same-parity-filter-list (cdr items))))
          (else (same-parity-filter-list (cdr items)))))
  (cons elem (same-parity-filter-list others)))

(define (same-parity? a b)
  (even? (+ a b)))