#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

; integral(f,a,b) = [f(a + dx/2) +
;                    f(a + dx + dx/2) +
;                    f(a + 2dx +dx/2] * dx

(define dx 0.0001)

(define (integral f a b)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

;sum(i^3,a,b) = computes the sum of the cubes from a through b
(define (cube x) (* x x x))
(define (inc x) (+ x 1))

(define (sum-cube a b)
  (sum cube a inc b))