#|
Exercise 2.35: Counting Leaves Through Accumulation

This exercise provides a template using map as the consumed list producer. This
is awkward and no perfer solution was found on the Internet. Hence I wrote down
this ``tree-to-list`` procedure putting all tree nodes in a flat list. An
ordinary ``accumulate`` application.
|#

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))


(define (tree-to-list x)
  (cond ((null? x) '())
        ((not (pair? x)) (list x))
        (else (cons x
              (accumulate append
                          '()
                          (map tree-to-list x))))))

(define (count-leaves t)
  (accumulate (lambda  (x y)
                       (if (pair? x) (+ 0 y) (+ 1 y)))
              0
              (tree-to-list t)))
