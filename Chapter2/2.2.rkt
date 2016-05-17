#lang racket

(define (make-point x y)
  (cons x y))

(define (xcor point)
  (car point))

(define (ycor point)
  (cdr point))
;=======================
(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))
;=======================
(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end   (end-segment s)))
    (make-point (average (xcor start) (xcor end))
                (average (ycor start) (ycor end)))))

(define (average x y)
  (/ (+ x y) 2))
;======================
(define (print-point p)
  (newline)
  (display "(")
  (display (xcor p))
  (display ",")
  (display (ycor p))
  (display ")"))

;Output:
(define a (make-point -1 2))
(define b (make-point 3 -6))
(define s (make-segment a b))
(define m (midpoint-segment s))
(print-point m)





                             