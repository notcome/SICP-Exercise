#|
Exercise 2.49: Primitive Painters
|#

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) 
         (start-segment segment))
        ((frame-coord-map frame) 
         (end-segment segment))))
     segment-list)))

(define (make-painter . data)
  (define (every-two list transform)
    (if (null? list)
        '()
        (cons (transform (car list) (cadr list)) 
              (every-two (cddr list) transform))))

  (if (not (= 0 (remainder (length data) 4)))
      'wrong-input
      (segments->painter
        (every-two
          (every-two data make-vect)
          make-segment))))

(define painter-outline
  (make-painter
    0 0 0 1
    0 1 1 1
    1 1 1 0
    1 0 0 0))

(define painter-X
  (make-painter
    0 0 1 1
    0 1 1 0))

(define painter-diamon
  (make-painter
;    0 0.5 0.5 0
;    0.5 0 1 0.5
;    1 0.5 0.5 1
;    0.5 1 0 0.5
;    0 0.5 1 0.5
    0.5 0 0.5 1))

; I don't want to do the wave one.
