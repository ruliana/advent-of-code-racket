#lang racket

(provide (contract-out
          [visited-houses (->* (string?) (natural-number/c) natural-number/c)]))

(define (visited-houses directions (number-of-santas 1))
  (dict-count (visit directions number-of-santas)))

(define (visit directions number-of-santas)
  (let* ([start-house (hash #(0 0) number-of-santas)])
    (move-and-delivery start-house
                       (make-list number-of-santas #(0 0))
                       (string->list directions))))

(define (move-and-delivery houses santas directions)
  (if (empty? directions) houses
      (let* ([d (first directions)]
             [santa (first santas)]
             [new-santa (move santa d)]
             [new-houses (delivery houses new-santa)])
        (move-and-delivery new-houses
                           ; Cycling santas
                           (append (rest santas) (list new-santa))
                           (rest directions)))))

; Santa moving
(define (move position direction)
  (match position
    [(vector x y)
     (case direction
       [(#\<) (vector (sub1 x) y)]
       [(#\>) (vector (add1 x) y)]
       [(#\^) (vector x (add1 y))]
       [(#\v) (vector x (sub1 y))]
       [else position])]))

; Houses delivering
(define (delivery houses position)
  (dict-update houses position add1 0))
