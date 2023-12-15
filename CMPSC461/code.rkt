#lang racket

;Problem 1
(define (totalCost n)
  (define (calculate-cost n)
    (cond
      ((<= n 10) (* n 5))
      ((<= n 20) (+ (* 10 5) (* (- n 10) 4)))
      ((<= n 30) (+ (* 10 5) (* 10 4) (* (- n 20) 3.5)))
      (else (+ (* 10 5) (* 10 4) (* 10 3.5) (* (- n 30) 3)))))
  
  (define (discount total)
    (if (> n 50)
        (- total 10)
        total))
  
  (discount (calculate-cost n)))


( totalCost 12)
( totalCost 37)
( totalCost 53)
(newline)

;Problem 2
(define (dot l1 l2)
  (cond ((null? l1) 0)
        (else
         (+ (* (car l1) (car l2))
            (dot (cdr l1) (cdr l2))))))

( dot '(1 2 3) '(4 5 6))
( dot '(1 -1 1 -1) '(2 2 2 2))
( dot '(1 2 3 4) '(5 6 7 8))
( dot '() '())
(newline)

;Problem 3
(define (adjDiff L)
  (if (null? L)
      '()
      (if (null? (cdr L))
          '()
          (cons (- (cadr L) (car L))
                (adjDiff (cdr L))))))

( adjDiff '(3 8 -1 4))
( adjDiff '(1 2 3 4 5))
( adjDiff '())
(newline)

;Problem 4
(define (collatz-length n)
  (define (collatz-helper num count)
    (cond
      ((= num 1) count)
      ((even? num) (collatz-helper (/ num 2) (+ count 1)))
      (else (collatz-helper (+ (* num 3) 1) (+ count 1)))))
  (collatz-helper n 0))

( collatz-length 7)
( collatz-length 2561)
( collatz-length 1005)
(newline)

;Problem 5
(define (trunc a b x)
  (map (lambda (xi)
         (cond
           [(< xi a) a]
           [(> xi b) b]
           [else xi]))
       x))

( trunc 0 1 '( -2 -1 0 1 2))
( trunc 0.5 1.5 '( -2 -1 0 1 2))
( trunc 1 1 '( -2 -1 0 1 2))
(newline)


;Problem 6
(define (leq lst1 lst2)
  (andmap <= lst1 lst2))

( leq '(1 2 3) '(2 3 3))
( leq '(1 2 3) '(3 2 1))
( leq '(1 0) '(0 1))
( leq '() '())


