#lang racket
(provide nice-string?
         nicer-string?)

(define (nice-string? a-string)
  (and
   (regexp-match? #px"[aeiou].*[aeiou].*[aieou]" a-string)
   (regexp-match? #px"(.)\\1" a-string)
   (not (regexp-match? #px"ab|cd|pq|xy" a-string))))

(define (nicer-string? a-string)
  (and
   (regexp-match? #px"(..).*\\1" a-string)
   (regexp-match? #px"(.).\\1" a-string)))

(define (count-matches matcher (input (in-lines)))
  (for/sum ([line input])
    (if (matcher line) 1 0)))