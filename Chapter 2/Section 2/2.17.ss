#|
Exercise 2.17: Last Pair

Due to some historical reasons, nil is no longer available. Use '() instead.
|#

(define (last-pair list)
  (if (null? list)
    '()
    (let ((ret-val (last-pair (cdr list))))
      (if (null? ret-val)
        (car list)
        ret-val))))
