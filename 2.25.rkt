#lang racket

(define x (list (list 7)))
x
(car(car x))

(define y (list 1 3 (list 5 7) 9))
y
(car(cdr(car(cdr(cdr y)))))

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
z
(car(cdr(car(cdr(car(cdr(car(cdr(car(cdr(car(cdr z))))))))))))