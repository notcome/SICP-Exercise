#|
Exericse 1.39: Tan
|#
 
(define (tan-cf x k)
  (define (N i)
    (if (= i 1) x (* x x)))
  (define (D i) (- (* i 2) 1))
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (N i) (- (D i) result)))))
  (iter k 0))