#|
Exercise 1.31: Product, Factorial and π

I prefer iterative process to recursive one. 
|#

(define (inc x) (+ x 1))
(define (self x) x)

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

(define (product-recursive term a next b)
  (if (= a b)
    (term a)
    (* (term a) (product-recursive term (next a) next b))
  )
)

(define (factorial x)
  (product self 1 inc x)
)

(define (factorial-recursive x)
  (product-recursive self 1 inc x)
)

(define (calculate-pi n)
  (define (term x)
    (if (= (remainder x 2) 0)
      (/ x (+ x 1.))
      (/ (+ x 1.) x)
    )
  )
  (* (product term 2 inc (+ n 1)) 4)
)