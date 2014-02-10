#|
Exericse 1.37: Infinite continued fraction

The iterative version calculates Nk/Dk first and then iterate backwards to one.

I am interested in a forward version or a proof of its impossibility.

The minimum of k to get an approximation that is accurate to 4 decimal places is 11.
|#

(define N (lambda (i) 1.))
(define D (lambda (i) 1.))

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (iter (- i 1) (/ (n i) (+ (d i) result)))
    )
  )
  (iter k 0)
)

(define (cont-frac-recursive n d k)
  (define (recursive i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (recursive (+ i 1))))
    )
  )
  (recursive 1)
)