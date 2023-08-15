(define (concat c lst)
	(cons (cons c (car lst)) (cdr lst))
)

(define (split-at lst n)
;   'YOUR-CODE-HERE
	(if (null? lst)
		'(())
		(if (= n 0)
			(cons nil lst)
			(concat (car lst) (split-at (cdr lst) (- n 1)))
		)
	)
)


(define-macro (switch expr cases)
	(cons 'cond
		(map (lambda (case) (cons (equal? (eval expr) (car case)) (cdr case)))
    			cases))
)

