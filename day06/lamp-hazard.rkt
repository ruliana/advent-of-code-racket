#lang racket
(provide new-grid
         grid-sum
         grid-change
         on-off
         dimmer)

(define (new-grid width height)
  (build-vector height (λ (x) (make-vector width 0))))

(define (grid-change grid instruction (semantic on-off))
  (let*-values ([(x1 y1 x2 y2 c) (parse-instruction instruction)]
                [(command) (semantic c)])
    (grid-range-set! grid x1 y1 x2 y2 command)))

(define (parse-instruction a-string)
  (match-let ([(list _ command x1 y1 x2 y2)
               (regexp-match #px"(turn on|turn off|toggle) (\\d+),(\\d+) through (\\d+),(\\d+)" a-string)])
    (values (string->number x1)
            (string->number y1)
            (string->number x2)
            (string->number y2)
            command)))

(define (on-off a-string)
  (case a-string
    [("turn on") (λ (_) 1)]
    [("turn off") (λ (_) 0)]
    [("toggle") (λ (x) (if (= x 0) 1 0))]))

(define (dimmer a-string)
  (case a-string
    [("turn on") add1]
    [("turn off") (λ (x) (if (<= x 0) x (sub1 x)))]
    [("toggle") (curry + 2)]))

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
