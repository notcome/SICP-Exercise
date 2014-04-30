#|
Exercise 2.27: Deep-Reverse
|#

(define (deep-reverse l)
  (define (worker old new)
    (cond ((null? old) new)
          ((list? (car old)) (worker (cdr old)
                                     (cons (worker (car old) '()) new)))
          (else (worker (cdr old) (cons (car old) new)))))
  (worker l '())
)
