#lang racket

(provide user user?)
(provide get-user-id get-user-username get-user-password get-user-age)
(provide set-user-username set-user-password set-user-age)

;; TDA Usuario

;; Capa constructor

;; Descripción: Constructor de un tipo de dato usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(define user
  (lambda (id username password age)
    (cond [(user? id username password age) (list id username password age)]
          [else '()])))


;; Capa de pertenencia

;; Descripción: Verifica si el tipo de dato es un usuario
;; Dom: id <int>, username <str>, password <str>, age <int>
;; Rec: usuario <list>
;; Tipo de recursión: NA
(define user?
  (lambda (id username password age)
    (cond [(and (number? id) (string? username) (string? password) (number? age))
           #t]
          [else #f])))


;; Capa de selector

;; Descripción: Retorna el id del usuario
;; Dom: user <list>
;; Rec: id <int>
;; Tipo de recursión: NA
(define get-user-id
  (lambda (user)
    (car user)))

;; Descripción: Retorna el username del usuario
;; Dom: user <list>
;; Rec: username <str>
;; Tipo de recursión: NA
(define get-user-username
  (lambda (user)
    (cadr user)))

;; Descripción: Retorna el password del usuario
;; Dom: user <list>
;; Rec: password <str>
;; Tipo de recursión: NA
(define get-user-password
  (lambda (user)
    (caddr user)))

;; Descripción: Retorna la edad del usuario
;; Dom: user <list>
;; Rec: age <int>
;; Tipo de recursión: NA
(define get-user-age
  (lambda (user)
    (cadddr user)))

;; Capa de modificador

;; Descripción: Retorna un nuevo tipo de dato usuario con un nuevo username
;; Dom: user <list>, username<str>
;; Rec: user <list>
;; Tipo de recursión: NA
(define set-user-username
  (lambda (user username)
    (list (get-user-id user) username (get-user-password user) (get-user-age user))))

;; Descripción: Retorna un nuevo tipo de dato usuario con un nuevo password
;; Dom: user <list>, password<str>
;; Rec: user <list>
;; Tipo de recursión: NA
(define set-user-password
  (lambda (user password)
    (list (get-user-id user) (get-user-username user) password (get-user-age user))))

;; Descripción: Retorna un nuevo tipo de dato usuario con una nueva edad
;; Dom: user <list>, age <int> 
;; Rec: user <list>
;; Tipo de recursión: NA
(define set-user-age
  (lambda (user age)
    (list (get-user-id user) (get-user-username user) (get-user-password user) age)))