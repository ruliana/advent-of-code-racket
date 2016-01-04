#lang racket
(require openssl/md5)

(define (advent-coin secret number)
  (let ([a-string (format "~a~a" secret number)])
    (md5 (open-input-string a-string))))

(define (mine secret (prefix "00000"))
  (let loop ([number 0])
    (let ([coin (advent-coin secret number)])
      (if (string-prefix? coin prefix)
          (vector number coin)
          (loop (add1 number))))))