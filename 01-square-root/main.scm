; Example 1.1.7
;
(define (sqrt x)
  square-root-itr 1.0 x)

(define (square-root-itr guess x)
  (if (good-enough? guess x)
      guess
      (square-root-itr (improve guess x) x)))

(define (good-enough? a b)
  (< (abs (- (square a) b)) 0.0001))

(define (square x) (* x x))

(define (improve guess x)
  (avg guess (/ x guess)))

(define (avg a b)
  (/ (+ a b) 2))
