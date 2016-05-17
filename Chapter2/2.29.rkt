#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))
;====
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))
;====
(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))
;====

(define (total-weight mobile)
  (+ (weight-of-branch (left-branch mobile))
     (weight-of-branch (right-branch mobile))))

(define (weight-of-branch branch)
  (if (list? (branch-structure branch))
      (weight-of-branch (branch-structure branch))
      (branch-structure branch)))


(total-weight (list (list 1 (list 0 5)) (list 0 3)))

(define (branch-torque branch)
   (* (branch-length branch)
      (branch-weight branch)))

(define (branch-balanced? branch)
   (if (pair? (branch-structure branch))
       (balanced? (branch-structure branch))
       true))

(define (balanced? mobile)
   (and (= (branch-torque (left-branch mobile))
           (branch-torque (right-branch mobile)))
        (branch-balanced? (left-branch mobile))
        (branch-balanced? (right-branch mobile))))