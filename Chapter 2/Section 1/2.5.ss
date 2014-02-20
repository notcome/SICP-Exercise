#|
Exercise 2.5: Using 2^a*3^b to Represent Pairs Constructed by Nonnegative Numbers
|#

(define (expt a b)
  (if (= a 0) 1 (* b (expt (- a 1) b))))

(define (get-power z b)
  (if (= (remainder z b) 0)
    (+ 1 (get-power (/ z b) b))
    0))

(define (my-cons x y)
  (* (expt x 2) (expt y 3)))

(define (my-car z)
  (get-power z 2))

(define (my-cdr z)
  (get-power z 3))