#|
Exercise 2.30: Square treeree
|#

(define (square-tree tree)
  (cond ((null? tree) '())
        ((pair? tree) (cons (square-tree (car tree)) (square-tree (cdr tree))))
        (else (* tree tree))))

(define (square-tree-using-map tree)
  (define (tree-map action tree)
    (cond ((null? tree) '())
          ((pair? tree) (cons (tree-map action (car tree))
                              (tree-map action (cdr tree))))
          (else (action tree))))
  (tree-map (lambda (x) (* x x)) tree))
