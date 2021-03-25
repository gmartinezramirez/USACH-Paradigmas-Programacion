#lang racket

(require "TDA/User_RUT_APELLIDOS.rkt")

;; Main

(define dummy-user (user 0 "myUsername" "myPassword" 29))
(display "id: " get-user-id dummy-user)
(get-user-username dummy-user)
(get-user-password dummy-user)
(get-user-age dummy-user)
