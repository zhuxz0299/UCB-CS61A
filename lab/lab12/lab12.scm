
; (define-macro (def func args body)
;     (list 'define func (list 'lambda args body))
; )


(define-macro (def func args body)
  ;; YOUR-CODE-HERE
  (list 'define (cons func args) body)
)

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define all-three-multiples
  (cons-stream 3 (map-stream (lambda (x) (+ x 3)) all-three-multiples))
)


(define (compose-all funcs)
  (if (null? funcs)
  	(lambda (x) x)
  	(lambda (x) ((compose-all (cdr funcs)) ((car funcs) x)))
  )
)


(define (partial-sums stream)
  (if (null? stream)
    nil
    (cons-stream 
      (car stream)
      (map-stream 
        (lambda (x) (+ x (car stream))) 
        (partial-sums (cdr-stream stream))
      )
    )
  )
)

