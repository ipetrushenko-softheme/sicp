#lang racket

(define (square x) (* x x))

(define (sum-of-square-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) (if (odd? tree) (square tree) 0))
        (else (+ (sum-of-square-leaves (car tree))
                 (sum-of-square-leaves (cdr tree))))))

(define (even-fib n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

(define (fib n)
  (if (< n 2)
      n
      (+ (fib (- n 1))
         (fib (- n 2)))))

(define (filter predicate items)
  (if (null? items)
      '()
      (if (predicate (car items))
          (cons (car items) (filter predicate (cdr items)))
          (filter predicate (cdr items)))))

(define (enumerate low high)
  (if (> low high)
      '()
      (cons low (enumerate (+ low 1) high))))

(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items)
          (accumulate op initial (cdr items)))))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (map2 proc items)
  (accumulate (lambda (x y) (cons (proc x) y))
              '()
              items))

(define (even-fib-2 n)
  (accumulate cons
              '()
              (filter even?
                     (map fib (enumerate 0 n)))))

(define (append items1 items2)
  (accumulate cons items2 items1))

(define (length sequence)
  (if (null? sequence)
      0
      (+ 1 (length (cdr sequence)))))

(define (length2 items)
  (accumulate (lambda (x y) (+ 1 y))
              0
              items))