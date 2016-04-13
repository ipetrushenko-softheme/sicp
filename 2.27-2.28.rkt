#lang racket

(define (append items1 items2)
  (if (null? items1)
      items2
      (cons (car items1) (append (cdr items1) items2))))
;===========================
(define (reverse items)
  (if (null? items)
      '()
      (append (reverse (cdr items))
              (list (car items)))))

;===========================
(define (reverse-iter items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items)
              (append (list (car items)) result))))
  (iter items '()))

;===========================
(define (deep-reverse items)
  (cond ((null? items) '())
        ((list? (car items)) (append (deep-reverse (cdr items))
                                     (list (deep-reverse (car items)))))
        (else (append (deep-reverse (cdr items))
                      (list (car items))))))
;===========================

(reverse (list 1 2 3))
(reverse-iter (list 1 2 3))
(deep-reverse (list (list 1 2 3) (list 4 5 6)))


;============================
(define (fringe items)
  (cond ((null? items) '())
        ((not (list? items)) (list items))
        (else (append (fringe (car items))
                      (fringe (cdr items))))))

(define x (list (list 1 2 3) (list 1 2)))
(fringe (list x x))

;=============================
