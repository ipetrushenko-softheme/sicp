#lang racket

(define (make-interval a b)
  (cons a b))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;== 2.10
(define (div-interval x y)
  (let ((a (upper-bound y))
        (b (lower-bound y)))
    (if (or (= a 0) (= b 0))
        (error "Argument exception")
        (mul-interval x
                      (make-interval (/ 1.0 a)
                                     (/ 1.0 b))))))

; == 2.7

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

; == 2.8

(define (sub-interval first_interval second_interval)
  (make-interval  (- (lower-bound first_interval)
                     (upper-bound second_interval))
                  (- (upper-bound first_interval)
                     (lower-bound second_interval))))
; == 2.11

(define (mul-interval-second x y)
   (let ((xlo (lower-bound x))
         (xhi (upper-bound x))
         (ylo (lower-bound y))
         (yhi (upper-bound y)))
   (cond ((and (>= xlo 0)
               (>= xhi 0)
               (>= ylo 0)
               (>= yhi 0))
          ; [+, +] * [+, +]
          (make-interval (* xlo ylo) (* xhi yhi)))
         ((and (>= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (>= yhi 0))
          ; [+, +] * [-, +]
          (make-interval (* xhi ylo) (* xhi yhi)))
         ((and (>= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (<= yhi 0))
          ; [+, +] * [-, -]
          (make-interval (* xhi ylo) (* xlo yhi)))
         ((and (<= xlo 0)
               (>= xhi 0)
               (>= ylo 0)
               (>= yhi 0))
          ; [-, +] * [+, +]
          (make-interval (* xlo yhi) (* xhi yhi)))
         ((and (<= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (>= yhi 0))
          ; [-, +] * [-, +]
          (make-interval (min (* xhi ylo) (* xlo yhi))
                         (max (* xlo ylo) (* xhi yhi))))
         ((and (<= xlo 0)
               (>= xhi 0)
               (<= ylo 0)
               (<= yhi 0))
          ; [-, +] * [-, -]
          (make-interval (* xhi ylo) (* xlo ylo)))
         ((and (<= xlo 0)
               (<= xhi 0)
               (>= ylo 0)
               (>= yhi 0))
          ; [-, -] * [+, +]
          (make-interval (* xlo yhi) (* xhi ylo)))
         ((and (<= xlo 0)
               (<= xhi 0)
               (<= ylo 0)
               (>= yhi 0))
          ; [-, -] * [-, +]
          (make-interval (* xlo yhi) (* xlo ylo)))
         ((and (<= xlo 0)
               (<= xhi 0)
               (<= ylo 0)
               (<= yhi 0))
          ; [-, -] * [-, -]
          (make-interval (* xhi yhi) (* xlo ylo))))))

; == 2.12

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

(define (percent i)
  (* 100.0 (/ (width i) (center i))))
