#lang racket
(provide nice-string?)

(define (nice-string? a-string)
  (and
   (regexp-match? #px"[aeiou].*[aeiou].*[aieou]" a-string)
   (regexp-match? #px"(.)\\1" a-string)
   (not (regexp-match? #px"ab|cd|pq|xy" a-string))))

(define (count-nice (input (in-lines)))
  (for/sum ([line input])
    (if (nice-string? line) 1 0)))