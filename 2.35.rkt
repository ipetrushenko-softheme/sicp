#lang racket

(require racket/trace)
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

(define (accumulate op initial items)
  (if (null? items)
      initial
      (op (car items)
          (accumulate op initial (cdr items)))))

(define (count-leaves-acc tree)
  (accumulate + 0 (map (lambda (x) 1)
                       (enumerate tree))))

(define (enumerate tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate (car tree))
                      (enumerate (cdr tree))))))