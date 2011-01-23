;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname hanoi) (read-case-sensitive #t) (teachpacks ((lib "arrow-gui.ss" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "arrow-gui.ss" "teachpack" "htdp")))))
(define (hanoi n src dst tmp)
  (if (= n 0) '()
      (append (hanoi (- n 1) src tmp dst)
              (list (list src dst))
              (hanoi (- n 1) tmp dst src))))
