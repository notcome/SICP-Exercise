#|
Exercise 1.29: Simpson’s Rule

Let z1 = y0 + 4y1 + y2, z2 = y2 + 4y3 + y4, ... zm = y(n-2) + 4y(n-1) + yn.

zj = y(2j - 2) + 4y(2j - 1) + y(2j), j is from 1 to n / 2.

It is much easier to implement now.
|#

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ (* k h) a)))
  (define (z j) (+ (y (+ j j -2)) (* 4 (y (+ j j -1))) (y (+ j j))))

  (define (sum i)
    (if (> i (/ n 2))
      0
      (+ (/ (* (z i) h) 3.) (sum (+ i 1)))
    )
  )
  (sum 1)
)