#|
Exercise 2.23: Foreach
|#

(define (for-each action list)
  (define (next list)
    (action (car list))
    (cdr list))
  (if (null? list)
    true
    (for-each action (next list))))
