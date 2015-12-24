#lang racket
(require rackunit "eggnog-directions.rkt")

(check-equal? (visited-houses ">") 2)
(check-equal? (visited-houses "^>v<") 4)
(check-equal? (visited-houses "^v^v^v^v^v") 2)
