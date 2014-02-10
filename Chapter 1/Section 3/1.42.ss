#|
Exercise 1.42: Compose
|#

(define (compose f g)
  (lambda (x) (let ((y (g x))) (f y))))