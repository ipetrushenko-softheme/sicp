#lang racket

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (append l1 l2)
  (if (null? l1)
      l2
      (cons (car l1) (append (cdr l1) l2))))
  
(define (last-pair items)
  (let ((l (length items)))
    (list-ref items (- l 1))))

(define (last-pair2 items)
  (let ((s (cdr items)))
  (if (null? s)
      (car items)
      (last-pair2 s))))
