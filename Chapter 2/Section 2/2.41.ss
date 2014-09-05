#|
Exercise 2.41: Triples Sum To S
|#

(define (enumerate-interval  from to)
  (if (> from to)
    '()
    (cons from (enumerate-interval  (+ from 1) to))))

(define accumulate fold-right)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap
    (lambda (x)
      (map (lambda (y) (list x y))
           (enumerate-interval  1 (- x 1))))
    (enumerate-interval  1 n)))

(define (unique-triples n)
  (flatmap
    (lambda (pair)
      (let ((x (car pair)) (y (cadr pair)))
        (map (lambda (z) (list x y z))
             (enumerate-interval  1 (- y 1)))))
    (unique-pairs n)))

(define (given-sum-triples n s)
  (filter (lambda (l)
            (let ((x (car l)) (y (cadr l)) (z (caddr l)))
                 (= (+ x y z) s)))
          (unique-triples n)))
