#|
Exercise 2.6: Church Numerals

```
zero: (lambda (f) (lambda (x)
    x))
one: (lambda (f) (lambda (x)
    (f ((n f) x))))
=> (lambda (f) (lambda (x)
    (f x)))
two: (lambda (f) (lambda (x)
    (f ((n f) x))))
=> (lambda (f) (lambda (x)
    (f (f x))))
```
We can conclude from the above code that in Church numerals, we represent a nonnegative integer ``n`` by apply ``f`` to x for ``n`` times.

We can get the numeral value through the following code.
```
((n (lambda (x) (+ x 1))) 0)
```
|#

(define zero (lambda (f) (lambda (x) x)))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))
(define (add a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define (to-numeral n)
  ((n (lambda (x) (+ x 1))) 0))