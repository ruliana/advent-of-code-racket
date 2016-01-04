#lang racket
(require rackunit "nice-string.rkt")

; Nice String
(check-true (nice-string? "ugknbfddgicrmopn"))
(check-true (nice-string? "aaa"))
(check-false (nice-string? "jchzalrnumimnmhp"))
(check-false (nice-string? "haegwjzuvuyypxyu"))
(check-false (nice-string? "dvszwmarrgswjxmb"))

; Better version: Nicer String
(check-true (nicer-string? "qjhvhtzxzqqjkmpb"))
(check-true (nicer-string? "xxyxx"))
(check-false (nicer-string? "uurcxstgmygtbstg"))
(check-false (nicer-string? "ieodomkazucvgmuy"))