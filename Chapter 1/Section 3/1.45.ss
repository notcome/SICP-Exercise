#|
Exercise 1.45: Nth Root

The experiment shows that if we want to get the nth root of x, we need to use logn/log2 average damps.

I tried to prove it but failed. Then I read the items about [fixed point on Wikipedia](http://en.wikipedia.org/wiki/Fixed_point_(mathematics)). It is much more complex than expected.

Considering that I am a high school student, I think my failure is reasonable.
|#

(define tolerance 0.00001)

(define (average-damp f)
  (lambda (x) (/ (+ (f x) x) 2)))

(define (compose f g)
  (lambda (x) (let ((y (g x))) (f y))))

(define (repeated f x)
  (if (= x 1) f (compose f (repeated f (- x 1)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (nth-root x n)
  (define (log2 x) (/ (log n) (log 2.)))
  (let ((f (lambda (y) (/ x (expt y (- n 1)))))
        (times (floor (log2 n))))
       (display times) (newline)
       (fixed-point ((repeated average-damp times) f) 1.)))