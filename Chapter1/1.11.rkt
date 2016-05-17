#lang racket

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+      (f-rec (- n 1))
                 (* 2 (f-rec (- n 2)))
                 (* 3 (f-rec (- n 3)))))))

(define (f-iter n)
  (iter 2 1 0 n))

(define (iter a b c count)
  (if (= count 0)
      c
      (iter (+ a (* 2 b) (* 3 c))
            a
            b
            (- count 1))))
                 
