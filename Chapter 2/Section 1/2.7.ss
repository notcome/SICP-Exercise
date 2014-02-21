#|
Exercise 2.7: Interval Arithmetic - Selectors
|#

(define (make-interval a b) (cons a b))
(define (lower-bound c) (min (car c) (cdr c)))
(define (upper-bound c) (max (car c) (cdr c)))