#lang racket

(provide visited-houses)

(define (visited-houses directions)
  (dict-count (visit directions)))

(define (visit directions)
  (let* ([start-house #hash((#(0 0) . 1))])
    (walk-directions start-house 0 0 (string->list directions))))

(define (walk-directions houses x y directions)
  (if (empty? directions) houses
      (let* ([d (first directions)]
             [new-x (case d
                      [(#\<) (sub1 x)]
                      [(#\>) (add1 x)]
                      [else x])]
             [new-y (case d
                      [(#\^) (add1 y)]
                      [(#\v) (sub1 y)]
                      [else y])]
             [position (vector-immutable new-x new-y)]
             [new-houses (dict-update houses position add1 0)])
        (walk-directions new-houses new-x new-y (rest directions)))))
