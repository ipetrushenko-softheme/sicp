#lang racket

(define (reverse-right sequence)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              sequence))

(define (reverse-left sequence)
  (fold-left (lambda (x y) (cons y x))
             '()
             sequence))

(define (fold-right op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (fold-right op
                      init
                      (cdr sequence)))))

(define (fold-left op init sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init sequence))

(reverse-right (list 1 2 3))
(reverse-left  (list 1 2 3))