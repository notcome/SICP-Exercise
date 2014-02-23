#|
Exercise 2.13: Interval Multiplication

We have those definitions:
```
x * y = z

xlp = 1 - xp
xup = 1 + xp
ylp = 1 - yp
yup = 1 + yp
```

Remeber, tolerance is small so ``xp * yp`` can be neglected:
```
zl = xlp * ylp * xy = (1 - xp)(1 - yp)xy = (1 - xp - yp + xpyp)xy => (1 - xp - yp)xy
zu = xup * yup * xy = (1 + xp)(1 + yp)xy = (1 + xp + yp + xpyp)xy => (1 + xp + yp)xy
```

And the result is simple:
```
zc = (zl + zu) / 2 = xy
zp = (zc - zl) / zc = xy * (1 - 1 + xp + yp) / xy = xp + yp
```

For example, we want the product of (10 +/- 10%) and (20 +/- 5%). Use the above formula, we can get a result of (200 +/- 15%), namely (170, 230). The precise answer is (171, 231). The tolerance of this approximation is bearable.

|#

(define (make-interval a b) (cons a b))
(define (lower-bound c) (min (car c) (cdr c)))
(define (upper-bound c) (max (car c) (cdr c)))

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (width i)
  (/ (- (upper-bound i) 
        (lower-bound i)) 
     2))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.))))

(define (percent i)
  (/ (* 100. (width i)) (center i)))

(define (mul-interval x y)
  (let ((xp (percent x)) (yp (percent y)))
    (make-center-percent (* (center x) (center y)) (+ xp yp))))

