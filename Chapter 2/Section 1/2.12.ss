#|
Exercise 2.12: Intervals with Percentage Tolerances
|#

(define (make-interval a b) (cons a b))
(define (lower-bound c) (min (car c) (cdr c)))
(define (upper-bound c) (max (car c) (cdr c)))

(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (width i)
  (/ (- (upper-bound i) 
        (lower-bound i)) 
     2))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.))))

(define (percent i)
  (/ (* 100. (width i)) (center i)))
