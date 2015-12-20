#lang racket

(define (cont-frac n d k)
  (define (frac-rec i)
    (/ (n i)
       (+ (d i)
          (if (= i k)
              0
              (frac-rec (+ i 1))))))
  (frac-rec 1))

(define (e-minus-2 k)
  (cont-frac (lambda(i) 1.0)
             (lambda(i) (find-k i))
             k))

(define (find-k k)
  (cond ((<= k 2) k)
        ((= (remainder k 3) 2) (+ 2 (find-k (- k 3))))
        (else 1)))

(define e
  (+ 2.0 (e-minus-2 10)))


