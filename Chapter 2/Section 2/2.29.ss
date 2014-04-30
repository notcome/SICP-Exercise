#|
Exercise 2.29: Binary Mobile
|#

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (leave-branch? branch)
  (not (list? (branch-structure branch))))

#|
total-weight
|#

(define (total-weight mobile)
  (define (branch-weight branch)
    (if (leave-branch? branch)
      (branch-structure branch)
      (total-weight (branch-structure branch))))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

#|
balance?
Names of variables in this procedure are arbitrary. My mind is full of recursion
 now.
|#

(define (balance? mobile)
  (define (branch-torque branch)
    (let ((length (branch-length branch))
          (mobile-info (mobile-torque (branch-structure branch))))
         (if (null? mobile-info)
           '()
           (cons (car mobile-info)
                 (+ (cdr mobile-info) (* (car mobile-info) length))))))

  (define (mobile-torque mobile)
    (if (not (pair? mobile))
      (cons mobile 0)
      (let ((left-info (branch-torque (left-branch mobile)))
            (right-info (branch-torque (right-branch mobile))))
           (cond ((or (null? left-info) (null? right-info)) '())
                 ((= (cdr left-info) (cdr right-info))
                  (cons (+ (car left-info) (car right-info))
                        (+ (cdr left-info) (cdr right-info))))
                 (else '())))))

  (if (null? mobile-torque mobile) false true))

#|
Suppose we change the representation of mobiles so that the constructors are

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

How much do you need to change your programs to convert to the new
representation?

Since selectors' implementations are isolated from the upper code, only
selectors need rewriting.
|#
