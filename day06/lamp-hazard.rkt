#lang racket
(provide new-grid
         grid-sum
         grid-change)

(define (new-grid width height)
  (build-vector height (λ (x) (make-vector width 0))))

(define (grid-change grid instruction)
  (let-values ([(x1 y1 x2 y2 command) (parse-instruction instruction)])
    (grid-range-set! grid x1 y1 x2 y2 command)))

(define (parse-instruction a-string)
  (match-let ([(list _ c x1 y1 x2 y2)
               (regexp-match #px"(turn on|turn off|toggle) (\\d+),(\\d+) through (\\d+),(\\d+)" a-string)])
    (let ([command (case c
                     [("turn on") (λ (_) 1)]
                     [("turn off") (λ (_) 0)]
                     [("toggle") (λ (x) (if (= x 0) 1 0))])])
      (values (string->number x1)
              (string->number y1)
              (string->number x2)
              (string->number y2)
              command))))

(define (grid-ref grid x y)
  (vector-ref (vector-ref grid x) y))

(define (grid-set! grid x y value)
  (vector-set! (vector-ref grid x) y value))

(define (grid-range-set! grid x1 y1 x2 y2 modifier)
  (for* ([x (in-range x1 (add1 x2))]
         [y (in-range y1 (add1 y2))])
    (let* ([original (grid-ref grid x y)]
           [value (modifier original)])
      (grid-set! grid x y value))))

(define (grid-sum grid)
  (for*/sum ([row grid]
             [cell row])
    cell))
