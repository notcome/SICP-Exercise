#|
Exercise 2.32: Subset
|#

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
         (append rest (map (lambda (x) (cons (car s) x)) rest)))))
