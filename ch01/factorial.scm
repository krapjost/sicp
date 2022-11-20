(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))


;; 1.9 recursive or iterative
;; (+ 4 5)

;; recur
;; 3
;; 5
;; 8
;; 9
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))


;; iter
;; 3
;; 6
;; 9
(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

;; 1.10 Ackermann's function
;;

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 2 4)
(A 3 3)


;; Give concise mathematical definitions for the
;; functions computed by the procedures f, g, and h
;; for positive integer values of n.
;; For example, (k n) computes 5n power 2.
;;
(define (f n) (A 0 n))                  ;2n
(define (g n) (A 1 n))                  ;
(define (h n) (A 2 n))
(define (k n) (* 5 n n))


;; 1.2.2 Tree Recursion
;; (fib 5) == (+ (fib 4) (fib 3))
;; evolved process looks like a tree.

;; recur
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))


;; iter
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))


;; 1.11
;; write recursive/iterative f
;; f(n)=n if n<3
;; f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3.
;;


;; 1.12
;; pascal's triangle
;;     1
;;   1   1
;; 1   2   1
;; write a procedure that computes elements of pascal's triangle

(define (pascal n)
  (cond ((= n 1) 1)
        ((= n 2) 3)
        (else
         (pascal (+ n n)))

      ))


;; 1.13 Fib(n) is closest integer to
;;
;;
;;

1.2.3 Orders of Growth
