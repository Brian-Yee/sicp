; Excercise 2.2
(define (midpoint segment)
  (rescale
   (add-points (start-segment segment) (end-segment segment))
   2))

(define (add-points p1 p2)
  (make-point
   (+ (x-point p1) (x-point p2))
   (+ (y-point p1) (y-point p2))))

(define (rescale point scale)
  (make-point
   (/ (x-point point) scale)
   (/ (y-point point) scale)))

; Segment selectors and constructors
(define (make-segment pt1 pt2)
  (cons pt1 pt2))
(define (start-segment segment)
  (car segment))
(define (end-segment segment)
  (cdr segment))

; Point selectors and constructors
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

; Display purposes
(define (print-segment segment)
  (newline)
  (display "(")
  (display (start-segment segment))
  (display ", ")
  (display (end-segment segment))
  (display ")"))

(define (print-point point)
  (newline)
  (display "(")
  (display (x-point point))
  (display ", ")
  (display (y-point point))
  (display ")"))

(print-point (make-point 2 2))
(print-segment (make-segment (make-point 2 2) (make-point 5 10)))
(midpoint (make-segment (make-point 2 2) (make-point 5 10)))
