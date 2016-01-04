#lang racket
(require rackunit "nice-string.rkt")

(check-true (nice-string? "ugknbfddgicrmopn"))
(check-true (nice-string? "aaa"))
(check-false (nice-string? "jchzalrnumimnmhp"))
(check-false (nice-string? "haegwjzuvuyypxyu"))
(check-false (nice-string? "dvszwmarrgswjxmb"))