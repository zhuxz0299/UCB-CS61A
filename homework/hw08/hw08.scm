(define (new-pair c) ;(new-pair 5) -> (5 1)
    (cons c (cons 1 nil))
)

(define (increase-pair pair) ;(increase-pair (5 1))->(5 2)
    (cons
        (car pair)
        (cons (+ 1 (car (cdr pair))) nil)
    )
)

(define (count stream)
    (cons-stream
        (increase-pair (car stream))
        (cdr-stream stream)
    )
)

(define (rle s)
    (if (null? s)
        '() ; return empty list
        (cond
            ((null? (cdr-stream s)) (cons-stream (new-pair (car s)) nil)) ; if it's the last element, return (itself 1)
            ((= (car s) (car (car (rle (cdr-stream s))))) ; if the first number equals the next
                (count (rle (cdr-stream s)))
            )
            (else ; if the first number not equals the next
                (cons-stream (new-pair (car s)) (rle (cdr-stream s)))
            )
        )
    )
)

(define (expand-first-list s lists)
    (cons-stream
        (cons s (car lists))
        (cdr-stream lists)
    )
)

(define (form-first-list s)
    (cons-stream
        (cons (car s) nil)
        (group-by-nondecreasing (cdr-stream s))
    )
)

(define (group-by-nondecreasing s)
    (cond
        ((null? s) nil)
        ((null? (cdr-stream s)) (cons-stream (cons (car s) nil) nil))
        (else
            (define pre (group-by-nondecreasing (cdr-stream s)))
            (cond
                ((> (car s) (car (cdr-stream s))) (form-first-list s))
                (
                    (<= 
                        (car s) 
                        (car (car pre))
                    ) 
                    (expand-first-list (car s) pre)
                )
                (else (cons-stream (cons (car s) nil) pre))
            )
        )
    )
)


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

