#|
Exercise 2.4: Alternatvie Way to Represent Pairs
|#

(define (my-cons x y)
  (lambda (m) (m x y)))

(define (my-car z)
  (z (lambda (p q) p)))

#|
I think it is too obvious...
Anyway, let's use the substitution model.

The following lambda expression will take two arguments and return the first one.
```
(lambda (p q) (p))
```

And it will be passed to the procedure defined in ``my-cons``:
```
(lambda (m) (m x y))
```

which will apply a 2-argument procedure to the given ``x`` and ``y``.

So the first lambda expression will take ``x`` and ``y`` and return the first one, namely ``x``.
|#

(define (my-cdr z)
  (z (lambda (p q) q)))