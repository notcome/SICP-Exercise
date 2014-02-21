#|
Exercise 2.7: Interval Arithmetic - Subtraction
|#

(define (make-interval a b) (cons a b))
(define (lower-bound c) (min (car c) (cdr c)))
(define (upper-bound c) (max (car c) (cdr c)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y)) (- (upper-bound x) (lower-bound y))))