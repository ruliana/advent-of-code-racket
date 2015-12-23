#lang racket
(require rackunit "elf-package.rkt")

(check-equal? (read-parse-sum (open-input-string "0x0x0")) 0)
(check-equal? (read-parse-sum (open-input-string "2x3x4")) 58)
(check-equal? (read-parse-sum (open-input-string "1x1x10")) 43)
(check-equal? (read-parse-sum (open-input-string "1x1x10\n2x3x4")) (+ 43 58))
