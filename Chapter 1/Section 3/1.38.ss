#|
Exericse 1.37: The base of natural logarithms

``Scheme`` ignores the case. I initially defined the procedure ``e`` as ``(e n)`` and ``n`` concealed the procedure ``N``.
|#

(define N (lambda (i) 1.))
(define (D i)
  (if (= (remainder i 3) 2)
    (* (/ (+ i 1) 3) 2.)
    1.))

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))

(define (e k) (+ (cont-frac N D k) 2))