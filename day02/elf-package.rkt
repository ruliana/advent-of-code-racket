#lang racket
(define (present->paper w h l)
  (let* ([wl (* w l)]
         [wh (* w h)]
         [hl (* h l)]
         [slack (min wl wh hl)])
    (+ (* 2 wl) (* 2 wh) (* 2 hl) slack)))

(define (parse-line line)
  (let ([args (string-split line "x")])
    (for/list ([x (in-list args)]) (string->number x))))

(define (read-parse-sum [port (current-input-port)])
  (for*/sum ([line (in-lines port)])
    (apply present->paper (parse-line line))))

(provide read-parse-sum)
