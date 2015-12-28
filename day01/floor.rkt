#lang racket
(provide where-is-santa
         moves-until-floor)

(define (where-is-santa floor-map)
  (let-values ([(floor moves) (floor-walk floor-map +inf.0)])
    floor))

(define (moves-until-floor floor-map (goal-floor -1))
  (let-values ([(floor moves) (floor-walk floor-map goal-floor)])
    moves))

(define (floor-walk floor-map goal-floor)
  (let loop ([floor 0]
             [moves 0]
             [the-map (string->list floor-map)])
    (cond [(= floor goal-floor) (values floor moves)]
          [(empty? the-map) (values floor 0)]
          [else
           (loop (char->floor floor (first the-map))
                 (add1 moves)
                 (rest the-map))])))

(define (char->floor floor char)
  (+ floor
     (case char
       [(#\() +1]
       [(#\)) -1]
       [else 0])))