#|
Exercise 2.25: Find 7
|#

(define l1 '(1 3 (5 7) 9))
(define l2 '((7)))
(define l3 '(1 (2 (3 (4 (5 (6 7)))))))

(newline)
(display l1)
(newline)
(display (car (cdr (car (cdr (cdr l1))))))
(newline)

(display l2)
(newline)
(display (car (car l2)))
(newline)

(display l3)
(newline)
(display (car (cdr (car (cdr
          (car (cdr (car (cdr
           (car (cdr (car (cdr l3)))))))))))))
(newline)
