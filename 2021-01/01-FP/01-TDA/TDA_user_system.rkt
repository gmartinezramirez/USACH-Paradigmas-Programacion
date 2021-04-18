#lang racket

;; Escenario: Dado un sistema X que contiene usuarios. Implementar el TDA de usuario
;; Un usuario tiene username, edad, password y un estado que representa si esta logueado
;; o no el sistema.

;; Capa constructor ;;

;; Vamos a representar el TDA usuario como una lista que contiene los siguientes datos:
;; username, del tipo string
;; edad, llamado age, del tipo número
;; password, del tipo string
;; estado de logueado o no, llamado logged, del tipo booleano

;; Descripción: función constructora del TDA usuario
;; Dom: username <str>, edad <number>, password <str>, logged <boolean> 
;; Rec: usuario <list>
;; Recursión: NA
(define user
  (lambda (username age password logged)
    (cond
      [(user? username age password logged)
       (list username age password logged)]
      [else '()])))

;; Descripción: función que verifica la integridad de los argumentos del constructor del TDA
;;              esto complementa el constructor, si esta función retorna false, entonces no
;;              se puede construir el TDA
;; Dom: username <str>, edad <number>, password <str>, logged <boolean> 
;; Rec: true or false <boolean>
;; Recursión: NA
(define user?
  (lambda (username age password logged)
    (cond
      [(and (string? username)
            (number? age)
            (string? password)
            (boolean? logged))
       #t]
      [else #f])))


;; Capa selector ;;

;; Descripción: función que obtiene el username de un TDA usuario
;; Dom: usuario <user>
;; Rec: username <str>
;; Recursión: NA
(define get-username
  (lambda (current-user)
    (cond
      [(empty? current-user) '()]
      [else (car current-user)])))

;; Descripción: función que obtiene la edad de un TDA usuario
;; Dom: usuario <user>
;; Rec: age <number>
;; Recursión: NA
(define get-age
  (lambda (current-user)
    (cond
      [(empty? current-user) '()]
      [else (car (cdr current-user))])))

;; Descripción: función que obtiene el password de un TDA usuario
;; Dom: usuario <user>
;; Rec: password <str> 
;; Recursión: NA
(define get-password
  (lambda (current-user)
    (cond
      [(empty? current-user) '()]
      [else (car (cdr (cdr current-user)))])))

;; Descripción: función que obtiene el estado de logueo de un TDA usuario
;; Dom: usuario <user>
;; Rec: login status <boolean> 
;; Recursión: NA
(define get-logged-status
  (lambda (current-user)
    (cond
      [(empty? current-user) '()]
      [else (car (cdr (cdr (cdr current-user))))])))


;; Capa modificador ;;

;; Descripción: función que retorna un nuevo user con un nuevo username
;; Dom: usuario <user>, username <str>
;; Rec: usuario con un nuevo username <user>
;; Recursión: NA
(define set-username
  (lambda (current-user username)
    (cond
      [(and (empty? current-user) (not (string? username)))
       '()]
      [else (user username
                  (get-age current-user)
                  (get-password current-user)
                  (get-logged-status current-user))])))

;; Descripción: función que retorna un nuevo user con un nueva edad
;; Dom: usuario <user>, edad <number>
;; Rec: usuario con un nueva edad <user>
;; Recursión: NA
(define set-age
  (lambda (current-user age)
    (cond
      [(and (empty? current-user) (not (number? age)))
       '()]
      [else (user (get-username current-user)
                  age
                  (get-password current-user)
                  (get-logged-status current-user))])))

;; Descripción: función que retorna un nuevo user con un nuevo password
;; Dom: usuario <user>, password <str>
;; Rec: usuario con un nuevo password <user>
;; Recursión: NA
(define set-password
  (lambda (current-user password)
    (cond
      [(and (empty? current-user) (not (string? password)))
       '()]
      [else (user (get-username current-user)
                  (get-age current-user)
                  password
                  (get-logged-status current-user))])))

;; Descripción: función que retorna un nuevo user con un nuevo estado login
;; Dom: usuario <user>, logged <boolean>
;; Rec: usuario con un nuevo estado de login <user>
;; Recursión: NA
(define set-logged-status
  (lambda (current-user logged)
    (cond
      [(and (empty? current-user) (not (boolean? logged)))
       '()]
      [else (user (get-username current-user)
                  (get-age current-user)
                  (get-password current-user)
                  logged)])))


;; Ejecución

;; Capa constructor

(display "Capa constructor")
(newline)

;; Definiendo usuarios

(define user1
  (user "my-user-1" 28 "my-password-1" #f))

(define user2
  (user "my-user-2" 29 "my-password-2" #f))
  
;; Este usuario retorna una lista vacia, debido a que
;; el último parámetro es un número 0, no un boolean
(define user-invalid-1
  (user "my-user-invalid" 29 "my-password-2" 0))

;; Este usuario retorna una lista vacia, debido a que
;; la edad es un str pero tiene que ser un number
;; de igual forma, el estado de login es un número 0, no un boolean
(define user-invalid-2
  (user "my-user-invalid" "29" "my-password-2" 0))

(display "User 1")
(newline)
user1
(display "User 2")
(newline)
user2
(display "User invalid 1")
(newline)
user-invalid-1
(display "User invalid 2")
(newline)
user-invalid-2

;; Capa selector

(display "Capa selector")
(newline)

(display "get username user 1")
(newline)
;"my-user-1"
(get-username user1)
(display "get age user 1")
(newline)
;28
(get-age user1)
(display "get password user 1")
(newline)
;"my-password-1"
(get-password user1)
(display "get logged status user 1")
(newline)
;#f
(get-logged-status user1)

(display "get username user 2")
(newline)
;"my-user-2"
(get-username user2)
(display "get age user 2")
(newline)
;29
(get-age user2)
(display "get password user 2")
(newline)
;"my-password-2"
(get-password user2)
(display "get logged status user 2")
(newline)
;#f
(get-logged-status user2)

(display "get username invalid-user-1")
(newline)
;'()
(get-username user-invalid-1)
(display "get age invalid-user-1")
(newline)
;'()
(get-age user-invalid-1)
(display "get password invalid-user-1")
(newline)
;'()
(get-password user-invalid-1)
;'()
(display "get logged status invalid-user-1")
(newline)
(get-logged-status user-invalid-1)

;; Capa modificador

(display "Capa modificador")
(newline)

;'("my-new-username1" 28 "my-password-1" #f)
(set-username user1 "my-new-username1")
;'()
(set-username user1 99)
;'("my-user-1" 99 "my-password-1" #f)
(set-age user1 99)
;'()
(set-age user1 "99")
;'("my-user-1" 28 "my-new-password-1" #f)
(set-password user1 "my-new-password-1")
;'()
(set-password user1 #t)
;("my-user-1" 28 "my-password-1" #t)
(set-logged-status user1 #t)
;'()
(set-logged-status user1 "new-logged-status")

(display "Capa modificador en usuario invalido")
(newline)

;'()
(set-username user-invalid-1 "my-new-username1")
;'()
(set-username user-invalid-1 99)
;'()
(set-age user-invalid-1 99)
;'()
(set-age user-invalid-1 "99")
;'()
(set-password user-invalid-1 "my-new-password-1")
;'()
(set-password user-invalid-1 #t)
;'()
(set-logged-status user-invalid-1 #t)
;'()
(set-logged-status user-invalid-1 "new-logged-status")

;; System (TODO)

;(define (my-system users)
;  (list "system-name" users))

;(define initial-users-logged-in-system
;  (list (user "user-logged-1" 25 "password" #t)
;        (user "user-logged-2" 26 "password" #t)
;        (user "user-logged-3" 27 "password" #t)))

;(my-system initial-users-logged-in-system)