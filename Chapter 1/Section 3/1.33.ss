#|
Exercise 1.33: filtered-accumulate

I reused the code from Exercise 1.32.

Assignment 1 is to get the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written).

Assignment 2 is to get the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i<n such that GCD(i,n)=1).
|#

(define (GCD x y)
  (if (= y 0)
    x
    (GCD y (remainder x y))
  )
)

;It can't handle inputs less than 2.
(define (prime? x)
  (define (test y)
    (cond
      ((> (* y y) x) #t)
      ((= (remainder x y) 0) #f)
      (else (test (+ y 1)))
    )
  )
  (test 2)
)

(define (inc x) (+ x 1))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
    )
  )
  (iter a null-value)
)

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (filtered? x)
    (if (filter x)
      (term x)
      null-value
    )
  )
  (accumulate combiner null-value filtered? a next b)
)

(define (assignment-1 a b)
  (define (square x) (* x x))
  (filtered-accumulate prime? + 0 square a inc b)
)

(define (assignment-2 n)
  (define (filter x) (= (GCD n x) 1))
  (define (self x) x)
  (filtered-accumulate filter * 1 self 1 inc n)
)