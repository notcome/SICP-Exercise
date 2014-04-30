#|
Exercise 2.28: Fringe
|#

(define (fringe tree)
  (if (null? tree)
      true
      (let ((first (car tree)) (second (cdr tree)))
           (cond ((list? first) (fringe first))
                 (else (display first) (display " ")))
           (fringe second))))
