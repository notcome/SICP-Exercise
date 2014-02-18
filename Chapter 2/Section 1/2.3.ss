#|
Exercise 2.3: Representing Rectangles in 2 Ways
|#

(define (make-segment start end) (cons start end))
(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))
(define (make-point start end) (cons start end))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

#|
((x0, y0), (x1, y1))
|#
(define (make-rect-1 top-left bottom-right) (cons top-left bottom-right))
(define (top-left-1 rect) (car rect))
(define (bottom-right-1 rect) (cdr rect))
(define (top-right-1 rect) (make-point (x-point (bottom-right-1 rect)) (y-point (top-left-1 rect))))
(define (bottom-left-1 rect) (make-point (x-point (top-left-1 rect)) (y-point (bottom-right-1 rect))))
(define (width-1 rect) (abs (- (x-point (top-left-1 rect)) (x-point (top-right-1 rect)))))
(define (height-1 rect) (abs (- (y-point (top-left-1 rect)) (y-point (bottom-left-1 rect)))))

#|
((x0, y0), (width, height))
|#
(define (make-rect-2 top-left width height) (cons top-left (cons width height)))
(define (width-2 rect) (car (cdr rect)))
(define (height-2 rect) (cdr (cdr rect)))
(define (top-left-2 rect) (car rect))
(define (bottom-left-2 rect)
  (let ((x (x-point (top-left-2 rect))) (y (y-point (top-left-2 rect))))
  	(make-point x (+ y (height-2 rect)))))
(define (top-right-2 rect)
  (let ((x (x-point (top-left-2 rect))) (y (y-point (top-left-2 rect))))
  	(make-point (+ x (width-2 rect)) y)))
(define (bottom-right-2 rect)
  (make-point (top-right-2 rect) (bottom-left-2 rect)))

#|
Perimeter and area.

The two versions of both procedures have the same code except for selectors determined by the rectangle representation method.
|#
(define (perimeter-1 rect)
  (* 2 (+ (width-1 rect) (height-1 rect))))
(define (perimeter-2 rect)
  (* 2 (+ (width-2 rect) (height-2 rect))))
(define (area-1 rect)
  (* (width-1 rect) (height-1 rect)))
(define (area-2 rect)
  (* (width-2 rect) (height-2 rect)))

#|
Test code

I use a different coordinate system here: x: leftmost < 0 < rightmost, y: topmost < 0 < bottommost
|#
(define (test)
  (define (op arg) (display arg) (newline))
  (op "((x0, y0), (x1, y1))")
  (let ((rect (make-rect-1 (make-point 0 0) (make-point 3 3))))
  	(op "Perimeter:")
  	(op (perimeter-1 rect))
  	(op "Area:")
  	(op (area-1 rect)))

  (op "((x0, y0), (width, height))")
  (let ((rect (make-rect-2 (make-point 0 0) 3 3)))
  	(op "Perimeter:")
  	(op (perimeter-2 rect))
  	(op "Area:")
  	(op (area-2 rect))))
