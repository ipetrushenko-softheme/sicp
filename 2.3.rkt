#lang racket

(define (make-point x y)
  (cons x y))

(define (xcor point)
  (car point))

(define (ycor point)
  (cdr point))
;=========================
(define (make-rect downleft upperight)
  (cons downleft upperight))

(define (area-rect rect)
  (* (height rect) (width rect)))

(define (perimeter rect)
  (* 2 (+ (height rect) (width rect))))

(define (downleft rect)  (car rect))
(define (upperight rect) (cdr rect))

(define (height rect)
  (- (ycor downleft) (ycor upperight)))

(define (width rect)
  (- (xcor upperight) (xcor downleft)))