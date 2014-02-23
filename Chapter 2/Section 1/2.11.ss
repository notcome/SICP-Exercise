#|
Exercise 2.11: Simplified Multiplication

The code is undebugged because it is boring enough to discuss nine cases; I don't want to find nine test data.

---

Let's redefine "=": if an interval crosses a vaule, the interval = the certain value.

Each interval has three cases:

```
i < 0
i = 0
i > 0
```

Then we have nine cases to discuss:

```
i1 > 0, i2 > 0, ir = (i1.l * i2.l, i1.u * i2.u)
i1 > 0, i2 = 0, ir = (i1.u * i2.l, i1.u * i2.u)
i1 > 0, i2 < 0, ir = (i1.u * i2.l, i1.l * i2.u)
i1 = 0, i2 > 0, ir = i2 * i1
i1 = 0, i2 = 0, ir = (min(i1.l * i2.u, i1.u * i2.l), max(i1.l * i2.l, i1.u * i2.u))
i1 = 0, i2 < 0, ir = (i1.u * i2.u, i1.l * i2.l)
i1 < 0, i2 > 0, ir = i2 * i1
i1 < 0, i2 = 0, ir = i2 * i1
i1 < 0, i2 < 0, ir = abs(i1) * abs(i2) = (i1.u * i2.u, i1.l * i2.l)
```

I think the problem really boring.
|#

(define (make-interval a b) (cons a b))
(define (lower-bound c) (min (car c) (cdr c)))
(define (upper-bound c) (max (car c) (cdr c)))

(define (interval-more-0 i) (> (lower-bound i) 0))
(define (interval-less-0 i) (< (upper-bound i) 0))
(define (interval-equal-0 i) (not (or (interval-more-0 i) (interval-less-0 i))))

(define (mul-interval x y)
  (define (caller a b) (and (a x) (b y)))
  (define (getter a b c d)
    (make-interval (* (a x) (b y)) (* (c x) (d y))))

  (cond ((caller interval-more-0 interval-more-0)
         (getter lower-bound lower-bound upper-bound upper-bound))
        ((caller interval-more-0 interval-equal-0)
         (getter upper-bound lower-bound upper-bound upper-bound))
        ((caller interval-more-0 interval-less-0)
         (getter upper-bound lower-bound lower-bound upper-bound))
        ((caller interval-equal-0 interval-equal-0)
         (make-interval (min (* (lower-bound x) (upper-bound y))
                             (* (upper-bound x) (lower-bound y)))
                        (max (* (lower-bound x) (lower-bound x))
                             (* (upper-bound x) (upper-bound y)))))
        ((caller interval-equal-0 interval-less-0)
         (getter upper-bound upper-bound lower-bound lower-bound))
        ((caller interval-less-0 interval-less-0)
         (getter upper-bound upper-bound lower-bound lower-bound))
        (else (mul-interval y x))))
