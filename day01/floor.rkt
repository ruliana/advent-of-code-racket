#lang racket
(define (where-is-santa floor-map)
  (for/sum ([char floor-map])
    (case char
      [(#\() +1]
      [(#\)) -1]
      [else 0])))

(provide where-is-santa)