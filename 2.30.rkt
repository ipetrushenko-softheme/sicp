#lang racket

(require racket/trace)

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))

(scale-tree (list (list 1 2 3) (list 4 5 6)) 2)

(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree-second tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-second sub-tree)
             (* sub-tree sub-tree)))
       tree))

(define (square-tree-third tree)
  (tree-map (lambda (x) (* x x)) tree))

(define (tree-map proc tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree))
                    (tree-map proc (cdr tree))))))

(square-tree (list (list 1 2 3) (list 4 5 6)))
(square-tree-second (list (list 1 2 3) (list 4 5 6)))
(square-tree-third (list (list 1 2 3) (list 4 5 6)))