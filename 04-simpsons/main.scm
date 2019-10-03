; Simple Riemann Sum numerical integration of f(x)
(define (integral f a b dx)
  (let ((start (+ a (/ dx 2.0)))
        (end b))
    (* (sum f start (lambda (x) (+ x dx)) end)
       dx))
  ))

; Simpsons Method to numerically integrate f(x)
(define (simpsons f a b n)
  ; Infinitesimal spacing approximation
  (define h (/ (- b a) n))

  ; Repeating case
  (define (inner a b)
    (define start (+ a h))
    (define end (- b h h))
    (define (function x)
      (+
       (* 4 (f (+ x 0)))
       (* 2 (f (+ x h)))))

    (sum function start (lambda (x) (+ x h h)) end))

  ; Special cases
  (let ((first (f a))
        (penultimate (* 4 (f (- b h))))
        (last (f b)))
    (* (/ h 3)
       (+ first (inner a b) penultimate last))
    ))

; Shared functions between numerical integration methods
(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
