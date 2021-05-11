#lang racket

;; Pregunta tipo PEP

; La biblioteca CoolBooks ofrece el servicio de préstamo de libros. Como parte de una mejora en su oferta están evaluando la implementación de un sistema para préstamos online.
; Se le ha encargado a usted desarrollar un prototipo del nuevo sistema en pseudo-Scheme bajo el paradigma de programación funcional.

; En particular, usted debe implementar un prototipo del sistema de préstamo tomando en consideración los siguientes antecedentes.
; Toda préstamo de material bibliográfico tiene la siguiente información: un RUT del cliente, ID del recurso facilitado, fecha de préstamo, fecha de retorno, estado de retorno (boolean).
; Para su simplicidad, asuma que las fechas son simplemente un string.

;; Pregunta 1
; Diseñe una representación de él o los TDAs vinculados al registro de los préstamos de CoolBooks.
; Luego implemente sus constructores y funciones de pertenencia.

;;; Respuesta

;; En la capa de constructor y selector no usar comentarios, a menos que sea pedido
;; Esto ya que es rebundante comentar dichas capas
;; Constructores

(define prestamo
  (lambda (rut id fecha-prestamo fecha-retorno ha-sido-retornado?)
    (list rut id fecha-prestamo fecha-retorno ha-sido-retornado?)))

(define (lista-prestamos . prestamos) prestamos)

;; Selectores
(define (get-rut prestamo) (car prestamo))
(define (get-id prestamo) (cadr prestamo))
(define (get-fecha-prestamo prestamo) (caddr prestamo))
(define (get-fecha-retorno prestamo) (cadddr prestamo))
(define (get-ha-sido-retornado? prestamo) (cadddr (cdr prestamo)))

;; En su pep pueden simplemente simplificarlo como caddddr
;(define (get-ha-sido-retornado? pelicula) (caddddr prestamo))

;; Pregunta 2
; Implemente una función que permita añadir nuevos préstamos al registro de préstamos de SuperBooks.

;; Descripción: Función que recibe los datos que corresponden a un prestamo y lo agrega a una lista de prestamos
;;              preexistente. En caso de que esta lista se encuentre vacia, se agrega como primer elemento
;; Dom: rut str, id number, fecha-prestamo str, fecha-retorno str, ha-sido-retornado? boolean, lista-prestamos lista(prestamos)
;; Rec: lista de prestamos
;; Tipo de recursión: Recursión natural
;; Ejemplo de uso:
;; (define lista-prestamo-con-nuevo-prestamo
;;  (agregar-nuevo-prestamo "11249818-k" 2 "10-ene-21" "15-feb-21" #t lista-prestamos-actual))
;; Nota: Esto no considera que hayan duplicados o se ingrese prestamos ya existentes
(define agregar-nuevo-prestamo
  (lambda (rut id fecha-prestamo fecha-retorno ha-sido-retornado? lista-prestamos)
    (cond
      [(null? lista-prestamos)
       (cons (prestamo rut id fecha-prestamo fecha-retorno ha-sido-retornado?) null)]
      [else (cons (car lista-prestamos)
                  (agregar-nuevo-prestamo rut id fecha-prestamo fecha-retorno ha-sido-retornado? (cdr lista-prestamos)))])))

; Ejemplos
(define prestamo1
  (prestamo "18045598-1" 0 "01-ene-21" "" #f))

(define prestamo2
  (prestamo "18045598-1" 1 "10-ene-21" "" #f))

(define prestamo3
  (prestamo "17498818-0" 2 "10-ene-21" "15-feb-21" #t))

(define lista-prestamos-ejemplo
  (lista-prestamos prestamo1 prestamo2 prestamo3))

lista-prestamos-ejemplo

(define lista-prestamo-ejemplo-con-nuevo-prestamo
  (agregar-nuevo-prestamo "11249818-k" 2 "10-ene-21" "15-feb-21" #t lista-prestamos-ejemplo))

lista-prestamo-ejemplo-con-nuevo-prestamo

;; Pregunta 3
; A partir de los TDAs construidos en las preguntas 1 y 2, se solicita implementar las siguientes funciones que permitan lo siguiente:
; 3.1 (5 pts) Recuperar todos los préstamos para un rut dado.

;; Descripción: Función que actua como un filtro en base a una función predicado (booleano)
;; Dom: predicado (función que retorna un booleano), lista a filtrar
;; Rec: lista
;; Tipo de recursión: Recursión natural
;; Ejemplo de uso:
;; (mi-filtro (mi-funcion-predicado argumento) lista-prestamos)
;; Referencia: Función vista en clase del profesor Gonzalo Martinez
(define (mi-filtro pred lista)
  (cond
    [(null? lista) '()]
    [(pred (car lista))
     (cons (car lista) (mi-filtro pred (cdr lista)))]
    [else (mi-filtro pred (cdr lista))]))

;; Descripción: Función predicado currificada que devuelve #t si el rut ingresado existe en lista de prestamos
;;              caso contrario devuelve #f
;; Dom: rut str, prestamos (lista de prestamos)
;; Rec: boolean
;; Ejemplo de uso:
;; ((es-mismo-rut? "18045598-1") lista-prestamo-ejemplo)
(define es-mismo-rut?
  (lambda (rut)
    (lambda (prestamos)
      (cond
        [(eq? rut (get-rut prestamos)) #t]
        [else #f]))))

; Ejemplos
(mi-filtro (es-mismo-rut? "18045598-1") lista-prestamo-ejemplo-con-nuevo-prestamo)

; 3.2 (5 pts) Recuperar todos los préstamos con estado de retorno no devuelto (false).

;; Descripción: Función predicado currificada que devuelve #t si en la lista de prestamos se encuentra
;;              un prestamo que no haya sido devuelto (#f), caso contrario devuelve #t
;; Dom:  prestamos (lista de prestamos)
;; Rec: boolean
;; Ejemplo de uso:
;; (es-no-retornado? lista-prestamo-ejemplo)
(define es-no-retornado?
  (lambda (prestamos)
    (cond
      [(eq? #f (get-ha-sido-retornado? prestamos)) #t]
      [else #f])))

; Ejemplo
(mi-filtro es-no-retornado? lista-prestamo-ejemplo-con-nuevo-prestamo)

; 3.3 (10 pts) Recuperar todas las muestras de acuerdo a un criterio personalizado en una función f aplicable sobre los datos (individuales o conjunto) de un préstamo,
;; lo cual debe ser indicada en el momento de ejecutar la función.

;; El criterio personalizado de selección queda a gusto del estudiante, en este caso utilizaremos el criterio de el estado si esta devuelto o no

;; Descripción: Función predicado currificada que devuelve #t si en la lista de prestamos se encuentra
;;              un prestamo que coincida con el criterio personalizado
;; El criterio personalizado es el estado boolean que representa si un prestamo ha sido devuelto o no
;; Dom:  estado de devolución (boolean), prestamos (lista de prestamos)
;; Rec: boolean
;; Ejemplo de uso:
;; ((es-el-mismo-estado-de-devolucion? #t) lista-prestamo))
;; ((es-el-mismo-estado-de-devolucion? #f) lista-prestamo))
(define es-el-mismo-estado-de-devolucion?
  (lambda (estado)
    (lambda (prestamos)
      (cond
        [(eq? estado (get-ha-sido-retornado? prestamos)) #t]
        [else #f]))))

; Ejemplo
(mi-filtro (es-el-mismo-estado-de-devolucion? #t) lista-prestamo-ejemplo-con-nuevo-prestamo)
(mi-filtro (es-el-mismo-estado-de-devolucion? #f) lista-prestamo-ejemplo-con-nuevo-prestamo)