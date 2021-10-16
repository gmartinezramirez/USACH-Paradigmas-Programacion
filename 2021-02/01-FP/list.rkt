#lang racket

; Lista de compras donde cada elemento es un articulo
; Un articulo se compone de nombre y precio

; TDA Articulo
;; Capa constructor
; Dom: nombre str, precio number
; Rec: lista(nombre, precio)
;; id == version
;; car 1er elemento
;; cdr  cdResto
(define articulo
  (lambda (id nombre precio)
    (list id nombre precio)))

;(define constructor-tda
; (lambda (arg1 arg2 argn)
;    (list arg1 arg2 argn))

(define articulo1 (articulo 0 "computador" 999))
(define articulo2 (articulo 1 "botella" 100))
(define miobjeto (articulo 2 "termo" 123))


;; Capa selectora

;; car: obtener primer elemento de una lista
;; cdr: obtener el resto de una lista. Es decir, todos los elementos que no son el primero
;; cdr: RETORNAR LISTAS
;; car: RETORNAR PRIMER ELEMENTO

; [1,2,3,4,5]   = [2,3,4,5]  ;; slice
; car = 1
; cdr = [2,3,4,5]

; [1,2]   car=1   cdr=[2]
; list = cons
; (list 1 2 3 4) = (cons 1 (cons 2(cons 3(cons 4 null)))
; (list 1)  ; car= 1  cdr  (list 1 null)


; "cadddddr" ocupen esto para la pep

(define get-id
  (lambda (articulo)
    (car articulo)))

;; 2do elemento: cadr
;; (cadr articulo1)
(define get-nombre
  (lambda (articulo)
    (car (cdr articulo))))

;; 3er elemento: caddr
;; (caddr articulo1)
(define get-precio
  (lambda (articulo)
    (car (cdr (cdr articulo)))))

;; Capa modificadora
;; Lego, inmutabilidad

;; set
;; (define articulo
;;  (lambda (id nombre precio)
;;    (list id nombre precio)))

(define set-id
  (lambda (articulo-a-modificar nuevo-id)
    (articulo nuevo-id
              (get-nombre articulo-a-modificar)
              (get-precio articulo-a-modificar))))

(define articulo1-con-otro-id (set-id articulo1 "mi-id-string"))

(define set-precio
  (lambda (articulo-a-modificar nuevo-precio)
    (articulo (get-id articulo-a-modificar)
              (get-nombre articulo-a-modificar)
              nuevo-precio)))


;; Contenedor
;; (list elementos)  = (list e1 e2 e3 ... e9999)
;; lista1 = (list e1 e2 e3)...
;; lista2 = (list e1 e2 e3 e4)...

;; Que pasa si quiero buscar un elemento por ID?
;; (buscar-elemento-segun-id lista 10)
;; Ejemplo: (find-element-by-id lst-inicial 2)
(define find-element-by-id
  (lambda (lst id)
    (cond
      [(null? lst) null]
      [(eq? (get-id (car lst)) id) (car lst)]
      [else
       (find-element-by-id (cdr lst) id)])))


;; Si ahora quiero preguntar si un elemento x pertenece a una lista
;; Tambien llamado member
(define pertenece?
  (lambda (x lst)
    (cond
      [(null? lst) #f]
      [(eq? x (car lst) #t)]
      [else
       (pertenece? x (cdr lst))])))

;; e (id precio)
;; id = 4 esto es lo que busco
;; lista = (eid1 eid2 eid3 eid4)
;; lst = ( (list id1 precio1) (list id2 precio2) (list id3 precio3) )
;; car lst = (list id1 precio1)

;; (get-id (car lst)) = id1
;; (get-precio (car lst)) = precio1

; cdr lst = ( (list id2 precio2) (list id3 precio3) )
;; (car (cdr lst)) = (list id2 precio2)

;; (get-id (car (cdr lst)))= id2

;; (car (cdr (cdr lst)))) = (list id3 precio3)
;; (get-precio (car (cdr (cdr lst)))) = precio3

;;  (eid2 eid3 eid4)
;;    (eid3 eid4)
;;      (eid4)  == return this

;; Agregar lista
;; list 1 2 3 = (cons 1 (cons 2 (cons 3 null)))

;; Cuantas formas tengo de agregar un elemento a una lista
;; 1. Agregar elemento en la cabeza de la lista: me va a quedar como el primer elemento
;; 2. Agregar elemento al final de la lista, en la cola: me va a quedar como el ultimo elemento
;; 3. Agregar elemento elemento en una posicion random

;;1.

;; list a b c = (cons a(cons b(cons c))) = (cond d(cons a(cons c)))
;; list d a b c
;; (agregar-en-cabeza 5 (list (1 2 3 4))
;; (5 1 2 3 4)
;; Sin usando recursion
;; Tarea: como lo harian con recursion natural y recursion de cola
;; Ejemplo: (agregar-en-cabeza (list 1 2 3 4) 5)  Resultado: '(5 1 2 3 4)
;; Ejemplo: (agregar-en-cabeza (list 1 2 3 4) "hola") Resultado: '("hola" 1 2 3 4)
(define agregar-en-cabeza
  (lambda (lst elemento)
    (cons elemento lst)))

;; Lista
;; list 1 2 3 4 y quiero agregar al final el 5
;; doy vuelta 1 2 3 4 = 4 3 2 1
;; y agrego elemento por cabeza? = 5 4 3 2 1
;; lo vuelvo a dar vuelta = 1 2 3 4 5
;; Version declarativa
;; Tarea: como lo harian con recursion natural y recursion de cola
;; Ejemplo: (agregar-al-final (list 1 2 3 4) 5)  Resultado: '(1 2 3 4 5)
;; Ejemplo: (agregar-al-final (list 1 2 3 4) "hola") Resultado: '(1 2 3 4 "hola")
(define agregar-al-final
  (lambda (lst elemento)
    (reverse (cons elemento (reverse lst)))))

; Tipo de recursion: recursion natural
; Ejemplo: (insert-item (list 1 2 3 4) 50)
(define insert-item
  (lambda (lst item)
    (cond
      [(null? lst) (cons item null)]
      [else (cons (car lst)
                  (insert-item (cdr lst) item))])))

; (cons 0 (cons 1 (cons 2 '() )))


;Insertar sin duplicados de forma declarativa
;(insert-without-duplicates (list 1 2 3 4 5) 5)
;(insert-without-duplicates (list 1 2 3 4 5) 6)
;(define insert-without-duplicates
;  (lambda (lst item)
;    (cons item
;          (filter (lambda (e) (not (eqv? item e))) lst))))

;Insertar en cola sin duplicados de forma declarativa
;(declarative-insert-without-duplicates-op-member (list 1 2 3 4 5) 5)
;(declarative-insert-without-duplicates-op-member (list 1 2 3 4 5) 6)

(define (member? x list)
  (if (null? list) #f                                ;(1)
      (if (equal? x (car list)) #t                   ;(2)
          (member? x (cdr list)))))                 ;(3)


; Opcion 1: usando member
;(define declarative-insert-without-duplicates-op-member
;  (lambda (lst item)
;    (cond
;      [(member? item lst) lst]
;      [else
;       (reverse (cons item (reverse lst)))])))


(define declarative-insert-without-duplicates-op2
  (lambda (lst item)
    (cond
      [(member? item lst) lst]
      [else
       (append lst item)])))

;(my-inverse-tail-rec (list 1 2 3 4) null) = '(4 3 2 1)
(define my-inverse-tail-rec
  (lambda (lst lst-so-far)
    (cond
      [(null? lst) lst-so-far]
      [else
       (my-inverse-tail-rec (cdr lst)
                            (cons (car lst) lst-so-far))])))



(define (length-1 list)
  (if (null? list)
      0
      (+ 1
         (length-1 (cdr list))))) ; recursive call, NOT a tail-call


(define (length-2 list current-length)
  (if (null? list)
      current-length
      (length-2 (cdr list) ; recursive call, IS a tail-call
                (+ 1 current-length))))

;(define articulo
;  (lambda (id nombre precio)
;    (list id nombre precio)))

; (build-lista (list 1 2 3 4) 4) = '((1 2 3 4) 4)
; (build-lista (list 1 2 3 4) (list "a" "b" "c")) = '((1 2 3 4) ("a" "b" "c"))
(define (build-lst . elementos) elementos)

(define add-articulo-to-lst
  (lambda (lst elemento)
    (build-lst lst elemento)))

; Asumamos que la lista esta ordenada de tal forma que el ultimo elemento corresponde
; al ultimo articulo agregado. Es decir, la lista se fue agregando por cola
; (get-last-element-from-lst (list 1 2 3 4))

(define get-first-element-from-lst
  (lambda (lst)
    (car lst)))

(define get-last-element-from-lst
  (lambda (lst)
    (car (reverse lst))))


(define lst-inicial
  (build-lst (articulo 0 "miarticulo1" 100)
               (articulo 1 "miarticulo2" 200)
               (articulo 2 "miarticulo3" 300)))

lst-inicial
(find-element-by-id lst-inicial 2)

; (add-articulo-to-lst lst-inicial "nuevoarticulo" 999)
;(define lst-with-new-articulo
;  (lambda (lst nombre precio)
;    (insert-to-lst lst (articulo (+ 1 (get-id (get-last-element-from-lst lst)))
;                                         nombre
;                                         precio))))

;(lst-with-new-articulo lst-inicial "nuevoarticulo" 999)

(define recuperar-articulo-by-id
  (lambda (lst id)
    (cond
      [ (equal? (get-id (car lst)) id) (car lst)]
      [ else (recuperar-articulo-by-id (cdr lst) id)])))


; to-string
; (to-string (list "hola" " como estas" " bien y tu") "")
; Tipo de Recursion: recursion de cola
;(define to-string
;  (lambda (lst string-so-far)
;    (cond
;      [(null? lst) string-so-far (car lst)] 
;      [else
;       (to-string (cdr lst) (string-append string-so-far (car lst))) ])))
      

;(to-string (list "hola" " como estas" " bien y tu") "")

(define element->string
  (lambda (element)
    (cond
      [(number? element) (number->string element)]
      [else element])))

(define articulo->string
  (lambda (articulo string-so-far)      
    (cond
      [(null? (cdr articulo)) (string-append string-so-far
                                             (cond
                                               [(number? (car articulo)) (number->string (car articulo))]
                                               [else (car articulo)]))]
      [else (articulo->string (cdr articulo) (string-append string-so-far (car articulo)))])))


; A la vuelta del receso
; map
; filter
; reduce
; (number->string i)