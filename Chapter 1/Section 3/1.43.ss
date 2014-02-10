#|
Exercise 1.43: Repeated
|#

(define (compose f g)
  (lambda (x) (let ((y (g x))) (f y))))

(define (repeated f x)
  (if (= x 1) f (compose f (repeated f (- x 1)))))