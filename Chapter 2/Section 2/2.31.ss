#|
Exercise 2.31: Tree Map
|#

(define (tree-map action tree)
  (cond ((null? tree) '())
        ((pair? tree) (cons (tree-map action (car tree))
                            (tree-map action (cdr tree))))
        (else (action tree))))
