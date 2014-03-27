#|
Exercise 2.20: Same Parity

I am wondering if there is a way to write this program iteratively without
invok
|#

(define (same-parity-recursive . l)
  (define (get-first-parity l)
    (remainder (car l) 2))
  (define (same-parity-worker first-parity from)
    (if (null? from)
      '()
      (if (= (get-first-parity from) first-parity)
        (cons (car from) (same-parity-worker first-parity (cdr from)))
        (same-parity-worker first-parity (cdr from)))))
  (same-parity-worker (get-first-parity l) l))


(define (same-parity-iter . l)
  (define (get-first-parity l)
    (remainder (car l) 2))
  (define (same-parity-worker first-parity from to)
    (if (null? from)
      to
      (if (= (get-first-parity from) first-parity)
        (same-parity-worker first-parity (cdr from) (cons (car from) to))
        (same-parity-worker first-parity (cdr from) to))))
  (reverse (same-parity-worker (get-first-parity l) l '())))
