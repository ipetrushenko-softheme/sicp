#lang racket
;1 version
(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(square-list (list 1 2 3))

;2 version
(define (square x) (* x x))

(define (square-list2 items)
   (define (iter things answer)
     (if (null? things)
         answer
         (iter (cdr things)
               (append answer
                       (list (square (car things)))))))
   (iter items null))

(square-list2 (list 1 2 3))
