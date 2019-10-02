; Simple Riemann Sum numerical integration of f(x)
(define (integral f a b dx)
  (define (next x)
    (+ x dx))
  (define start (+ a (/ dx 2.0)))
  (* (sum f start next b)
     dx))

; Simpsons Method to numerically integrate f(x)
(define (simpsons f a b n)
  ; Infinitesimal spacing approximation
  (define h (/ (- b a) n))

  ; Special cases
  (define first (f a))
  (define penultimate (* 4 (f (- b h))))
  (define last (f b))

  ; Repeating case
  (define (inner a b)
    (define start (+ a h))
    (define end (- b h h))

    (define (next x) (+ x h h))
    (define (pattern x)
      (+
       (* 4 (f (+ x 0)))
       (* 2 (f (+ x h)))))
    (sum pattern start next end))

  (* (/ h 3)
     (+ first (inner a b) penultimate last)))

; Shared functions between numerical integration methods
(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
