(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)


(define (sign num)
  (cond 
    ((< num 0) -1)
    ((= num 0) 0)
    ((> num 0) 1)
  )
)


(define (square x) (* x x))

(define (pow x y)
  (cond 
    ((= y 0) 1)
    ((= y 1) x)
    (else (if (even? y)
              (square (pow x (/ y 2)))
              (* x (pow x (- y 1)))
          )
    )
  )
)


(define (unique s)
  (if (null? s)
      '()
      (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s))))
  )
)


(define (replicate x n)
  (define (replicate_helper x n lst)
    (if (= n 0)
        lst
        (replicate_helper x (- n 1) (cons x lst))
    )
  )
  (replicate_helper x n '())
)


(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner (term n) (accumulate combiner start (- n 1) term))
  )
)


(define (accumulate-tail combiner start n term)
  (define (accumulate-tail-helper combiner start n term result)
    (if (= n 0)
        result
        (accumulate-tail-helper combiner start (- n 1) term (combiner (term n) result))
    )
  )
  (accumulate-tail-helper combiner start n term start)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  (list 'map (list 'lambda (list var) map-expr) (list 'filter (list 'lambda (list var) filter-expr) lst))
)

