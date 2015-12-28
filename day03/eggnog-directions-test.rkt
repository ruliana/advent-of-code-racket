#lang racket
(require rackunit "eggnog-directions.rkt")

; One Santa
(check-equal? (visited-houses "") 1)
(check-equal? (visited-houses ">") 2)
(check-equal? (visited-houses "^>v<") 4)
(check-equal? (visited-houses "^v^v^v^v^v") 2)

; Santa and Santa-Robot (2 Santas)
(check-equal? (visited-houses "" 2) 1)
(check-equal? (visited-houses "^v" 2) 3)
(check-equal? (visited-houses "^>v<" 2) 3)
(check-equal? (visited-houses "^v^v^v^v^v" 2) 11)