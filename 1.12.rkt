#lang racket

(define (packal-triangle row col)
  (cond ((> col row) 0)
        ((< col 0) 0)
        ((= col 1) 1)
        ((+ (packal-triangle (- row 1) (- col 1))
            (packal-triangle (- row 1) col)))))