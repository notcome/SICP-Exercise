#|
Exercise 2.18: Reverse
|#

(define (reverse l)
  (define (reverse-iter from to)
    (if (null? from)
      to
      (reverse-iter (cdr from) (cons (car from) to))))
  (reverse-iter l '()))
