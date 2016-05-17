#lang racket

(define (foreach func items)
  (cond ((null? items) #t)
        (else (func (car items))
              (foreach func (cdr items)))))

(foreach (lambda(x) (newline) (display x))
         (list 57 321 88))