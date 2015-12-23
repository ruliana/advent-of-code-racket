#lang racket
(require rackunit "floor.rkt")

(check-equal? (where-is-santa "") 0)
(check-equal? (where-is-santa "(") 1)
(check-equal? (where-is-santa ")") -1)
(check-equal? (where-is-santa ")(((") 2)
(check-equal? (where-is-santa "()()") 0)
(check-equal? (where-is-santa "(()(()(") 3)
(check-equal? (where-is-santa "))(") -1)
(check-equal? (where-is-santa ")())())") -3)