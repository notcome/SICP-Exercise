#|
Exercise 1.44: Smoothing
|#

(define (compose f g)
  (lambda (x) (let ((y (g x))) (f y))))

(define (repeated f x)
  (if (= x 1) f (compose f (repeated f (- x 1)))))

(define (average x y z) (/ (+ x y z) 3))

(define (smooth f dx)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))
