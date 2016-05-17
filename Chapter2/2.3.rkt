#lang racket

(define (make-point x y) (cons x y))

(define (xcor point) (car point))

(define (ycor point) (cdr point))
;=========================
(define (make-segment p q)
  (cons p q))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))
;========================
(define (make-rect bottom-left upper-right)
  (cons bottom-left upper-right))

(define (bottom-left rect)  (car rect))
(define (upper-right rect) (cdr rect))

(define (rect-height rect)
  (- (ycor bottom-left) (ycor upper-right)))

(define (rect-width rect)
  (- (xcor upper-right) (xcor bottom-left)))
;==========================
(define (perimeter rectangle)
  (* 2 (+ (rect-width rectangle)
          (rect-height rectangle))))
 
(define (area rectangle)
  (* (rect-width rectangle)
     (rect-height rectangle)))
 
(define (make-rectangle left-segment bottom-segment)
  (cons left-segment bottom-segment))
 
;; selectors
(define (left-segment rectangle)
  (car rectangle))
 
(define (bottom-segment rectangle)
  (cdr rectangle))
 
;; utilities
(define (rect-width rectangle)
  (segment-length (bottom-segment rectangle)))
 
(define (rect-height rectangle)
  (segment-length (left-segment rectangle)))
 
(define r1 (make-rectangle 
              (make-segment (make-point 4 8 )
                            (make-point 4 16))
              (make-segment (make-point 4 8 )
                            (make-point 20 8 ))))
;===============================================
(define (area rect)
  (* (rect-height rect) (rect-width rect)))

(define (perimeter rect)
  (* 2 (+ (rect-height rect) (rect-width rect))))

