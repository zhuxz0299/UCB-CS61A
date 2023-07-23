
; (define-macro (def func args body)
;     'YOUR-CODE-HERE
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
  'YOUR-CODE-HERE
)


(define (compose-all funcs)
  'YOUR-CODE-HERE
)


(define (partial-sums stream)
  'YOUR-CODE-HERE
  (helper 0 stream)
)

