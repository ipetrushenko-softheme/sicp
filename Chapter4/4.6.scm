(define (let? exp)
  (and (pair? exp)
       (eq? (car exp) 'let)))

(define (let-param-bindings exp)
  (cadr exp))

(define (let-bindings exp)
  (cadr exp))

(define (let-param-names exp)
  (map car (let-bindings exp)))

(define (let-param-values exp)
  (map cadr (let-bindings exp)))

(define (let-body exp)
  (cddr exp))

(define (let->combination exp)
  (append
   (list (make-lambda (let-param-names exp)
                      (let-body exp)))
   (let-param-values exp)))