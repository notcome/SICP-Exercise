#|
Exercise 2.40: Unique-Pairs
|#

(define (generate-interval from to)
  (if (> from to)
    '()
    (cons from (generate-interval (+ from 1) to))))

(define (prime? n)
  (define (iter x)
    (cond ((= n 1) #f)
          ((< n (* x x)) #t)
          ((= 0 (remainder n x)) #f)
          (else (iter (+ x 1)))))
  (iter 2))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) 
        (cadr pair) 
        (+ (car pair) (cadr pair))))

(define accumulate fold-right)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-pairs n)
  (flatmap
    (lambda (x)
      (map (lambda (y) (list x y))
           (generate-interval 1 (- x 1))))
    (generate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))
