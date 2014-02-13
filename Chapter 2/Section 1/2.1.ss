#|
Exercise 2.1: Make-rat with negative number optimization
|#

(define (make-rat n d)
  (define (test x)
    (if (< x 0) 1 0))
  (let ((sign (+ (test n) (test d))))
    (if (= sign 1)
      (cons (- (abs n)) (abs d))
      (cons (abs n) (abs d)))))