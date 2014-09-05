#|
Exercise 2.44: Split

Key of this problem is to implement recursion inside a lambada. We could 
construct a lambda who takes itself as an argument and functions as a wrapper.
Its value is the true lambda, the worker. When we want to do recursion, we can 
apply the wrapper with itself and obtain the true inner worker.

A factorial using this technique is written here to illustrate, in both Scheme 
and ECMAScript 6:

(lambda (f) (f f)
  (lambda (fac)
    (lambda (x)
      (if (= x 1)
          1
          (* x ((fac fac) (- x 1)))))))

let fac = (f => f(f))(fac => x => x == 1 ? 1 : (fac(fac))(x - 1));

I was so sad that instead of figuring out this technique myself, I googled it 
first. Loss of fun! I thought that this should be a primitive operation.
|#

(define (split larger-pattern smaller-pattern)
  (lambda (f) (f f)
    (lambda (split)
      (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split split) 
                            painter
                            (- n 1))))
              (lager-pattern 
               painter
               (smaller-pattern
                smaller
                smaller))))))))

(define right-split (split beside below))
(define up-split (split below beside))
