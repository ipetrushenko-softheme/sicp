#lang racket

; 1 version
(define (list-without-last-pair items)
  (let ((s (cdr items)))
    (if (null? s)
        null
        (cons (car items)
              (list-without-last-pair s)))))

(define (last-pair items)
  (let ((s (cdr items)))
    (if (null? s)
        (car items)
        (last-pair s))))
   
(define (reverse items)
  (if (null? items)
       null
       (cons(last-pair items)
            (reverse (list-without-last-pair items)))))