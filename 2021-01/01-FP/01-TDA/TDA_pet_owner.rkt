#lang racket

(define pet
  (lambda (type name age hair-color)
    (list type name age hair-color)))

(pet "dog" "rupert1" 3 "white")

(define dog1
  (pet "dog" "rupert2" 2 "black"))

(define cat1
  (pet "cat" "garfield" 1 "orange"))


dog1

(define owner-initial-pets
  (list dog1 cat1))

(define owner
  (lambda (name pets)
    (list name pets)))

(owner "owner name" owner-initial-pets)