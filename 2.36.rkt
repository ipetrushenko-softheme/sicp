#lang racket

(define (accumulate op init items)
  (if (null? items)
      init
      (op (car items)
          (accumulate op init (cdr items)))))

(define (accumulate-n op init items)
  (if (null? (car items))
      '()
      (cons (accumulate op init (map car items))
            (accumulate-n op init (map cdr items)))))

(accumulate-n +
              0
              (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
