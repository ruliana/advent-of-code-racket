#lang racket
(require rackunit "lamp-hazard.rkt")
(require rackunit/gui)

(define lamp-tests
  (test-suite
   "Tests for lamps"
   
   (test-case
    "No change"
    (let ([grid (new-grid 10 10)])
      (check-equal? (grid-sum grid) 0)))
   
   (test-case
    "Change one"
    (let ([grid (new-grid 10 10)])
      (grid-change grid "turn on 0,0 through 0,0")
      (check-equal? (grid-sum grid) 1)))
   
   (test-case
    "Change all"
    (let ([grid (new-grid 1000 1000)])
      (grid-change grid "turn on 0,0 through 999,999")
      (check-equal? (grid-sum grid) 1000000)))

   (test-case
    "Toggle first line"
    (let ([grid (new-grid 1000 1000)])
      (grid-change grid "toggle 0,0 through 999,0")
      (check-equal? (grid-sum grid) 1000)))

   (test-case
    "Toggle four in the middle"
    (let ([grid (new-grid 1000 1000)])
      (grid-change grid "toggle 0,0 through 999,999")
      (grid-change grid "toggle 499,499 through 500,500")
      (check-equal? (grid-sum grid) 999996)))))

(test/gui lamp-tests)