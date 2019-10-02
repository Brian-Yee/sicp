(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x)
  (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x (* 2 h)))

  (define (outer a b) (+ (f a) (f b)))

  (define (pattern x)
    (+ (* 4 (f (+ x 0)))
       (* 2 (f (+ x h)))))

  (define (inner a b)
    (sum pattern a add-2h b))

  (define (edge b)
    (* 4 (f (- b h))))

  (* (/ h 3)
     (+ (outer a b) (edge b) (inner (+ a h) (- b h h)))))

(define (wtf n) (+ n 1))
