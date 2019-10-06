; Exercise 1.11
; Pascal's Triangle
; -----------------
;       col
;       0 1 2 3 4 5
; row + -----------
;   0 | 1 0 0 0 0 0
;   1 | 1 1 0 0 0 0
;   2 | 1 2 1 0 0 0
;   3 | 1 3 3 1 0 0
;   4 | 1 4 6 4 1 0
(define (n-choose-k row col)
  (cond ((= col 0) 1)
        ((< col 0) 0)
        ((> col row) 0)
        (else (+
               (pascal (- row 1) col)
               (pascal (- row 1) (- col 1))
               )
        )))

; Exercise 1.11
; Pascal's Triangle
; -----------------
;       col
;       0 1 2 3 4 5
; row + -----------
;   0 | 1 1 1 1 1 1
;   1 | 1 2 3 4 0 0
;   2 | 1 3 6 0 0 0
;   3 | 1 4 0 0 0 0
;   4 | 1 0 0 0 0 0
(define (pascal diag anti-diag)
  (cond ((= diag 0) 1)
        ((= anti-diag 0) 1)
        (else (+
               (pascal (- diag 1) anti-diag)
               (pascal diag (- anti-diag 1))
               )
        )))
