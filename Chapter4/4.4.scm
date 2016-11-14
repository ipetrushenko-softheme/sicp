(define (and? exp)
  (tagged-list? exp 'and))

(define (eval-and exp env)
  (define (iter exps env)
    (if (last-exp? exps)
        (eval (first-exp exps) env)
        (if (eval (first-exp exps) env)
            (iter (rest-exps exps) env)
            #f)))
  (iter (cdr exp) env))

(define (or? exp)
  (tagged-list? exp 'or))

(define (eval-or exp env)
  (define (iter exps env)
    (if (last-exp? exps)
      (eval (first-exp exps) env))
    (if (eval (first-exp exps) env)
        #t
        (iter (rest-exps exps) env)))
  (iter (cdr exp env) env))