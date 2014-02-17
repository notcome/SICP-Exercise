#|
Exercise 2.2: Line Segments in A Plane

* make-segment
* start-segment
* end-segment
* make-point
* x-point
* y-point
* print-point
* mid-point-segment

|#

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
(define (make-point start end) (cons start end))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average x y) (/ (+ x y) 2))

(define (mid-point-segment seg)
  (let ((start (start-segment seg)) (end (end-segment seg)))
    (make-point (average (x-point start) (x-point end)) (average (y-point start) (y-point end)))))