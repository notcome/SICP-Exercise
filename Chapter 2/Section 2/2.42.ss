#|
Exercise 2.42: Eight-Queens Puzzles
|#

(define (enumerate-interval  from to)
  (if (> from to)
    '()
    (cons from (enumerate-interval  (+ from 1) to))))

(define accumulate fold-right)

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define empty-board '())

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) 
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position 
                    new-row 
                    k 
                    rest-of-queens))
                 (enumerate-interval 
                  1 
                  board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (safe? k pos)
  (define (check-template new step pos)
    (cond ((null? pos) #t)
          ((= (+ new step) (car pos)) #f)
          (else (check-template (+ new step) step (cdr pos)))))

  (define (check-rows new pos) (check-template new 0 pos))
  (define (check-diag new pos) (check-template new -1 pos))

  (let ((new (car pos)) (rest (cdr pos)))
       (and (check-rows new rest)
            (check-diag new rest))))

(define (adjoin-position new k rest)
  (cons new rest))
