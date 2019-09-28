; Exercise 1.7

(define (cube-root x)
  (cube-root-iter 1.0 x))

(define (cube-root-iter y x)
  (if (isclose (* y y y) x)
      y
      (cube-root-iter (improve y x) x)))

(define (isclose a b)
  (< (abs (- a b)) 0.0001))

(define (improve y x)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))
