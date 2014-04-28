#|
Exercise 2.21: Square List
|#

(define (square x) (* x x))

(define (square-list-without-map items)
  (if (null? items)
      '()
    (cons (square (car items))
          (square-list-without-map (cdr items)))))

(define (square-list-with-map items)
  (map square items))
