#lang racket

; Pregunta 2

;; Pauta ideal (al implementar todo, es un 100% de logro)

;; TDA Sistema Pinguino
;; El sistema pinguino contiene:
;; - El registro de autores asociado,
;; - Todos los libros publicados en el sistema “Pingüino”
;; - Listado de usuarios clientes registrados

; Dominio: list x list x list
; Recorrido: libreria (list)
; Funcionalidad: Función que permite modificar la libreria/sistema/sistemaPinguino/etc
; Recursión: NA
;; Puede llamarse libreria, sistema, o sistema-pinguino
;; En la pauta, al sistema lo llamaremos libreria
(define (libreria lista-autores libros-publicados lista-usuarios)
  (list lista-autores libros-publicados lista-usuarios))

;; Capa selectora

(define (get-lista-autores libreria)
  (car libreria))

(define (get-libros-publicados libreria)
  (cadr libreria))

(define (get-usuarios libreria)
  (caddr libreria))

;; Capa modificadora

(define (set-lista-autores libreria-actual nueva-lista-autores)
  (libreria nueva-lista-autores
            (get-libros-publicados libreria-actual)
            (get-usuarios libreria-actual)))

(define (set-libros-publicados libreria-actual nuevos-libros-publicados)
  (libreria (get-lista-autores libreria-actual)
            nuevos-libros-publicados
            (get-usuarios libreria-actual)))

(define (set-usuarios-registrados libreria-actual nuevos-usuarios-registrados)
  (libreria (get-lista-autores libreria-actual)
            (get-libros-publicados libreria-actual)
            nuevos-usuarios-registrados))

;; Pauta simplificada (al implementar solo estas funciones, es un 75% de logro)

;; a) Implementar TDAs necesarios (2 ptos)

;; TDA sistema pinguino
; Constructor
;  No es necesario definir un TDA sistema pinguino
; Esto ya que en la PEP se pide: Implementar las funciones necesarias,
; no implementarlo realmente. De igual forma, un posible TDA queda así:
;(define (sistema-pinguino autores libros usuarios)
;  (list autores libros usuarios))

;; TDA Autor (0.5 ptos)
; Constructor
(define (autor nombre libros-publicados)
  (list nombre libros-publicados))

;; TDA Libro (0.5 ptos)
; Constructor
(define (libro nombre-autor nombre-libro precio-minimo precio-sugerido total-vendidos numero-paginas tags)
  (list nombre-autor nombre-libro precio-minimo precio-sugerido total-vendidos numero-paginas tags))

;; TDA Usuario (0.5 pto)
; Constructor
(define (usuario username libros-comprados)
  (list username libros-comprados))

(define (lista-autores . autores) autores)
(define (lista-libros . libros) libros)
(define (lista-usuarios . usuarios) usuarios)


;; Selectores (0.5 pto)
;; Estos selectores eran los minimos necesarios, solo bastaba con estos
(define (get-username usuario) (car usuario))
(define (get-libros-comprados usuario) (cadr usuario))

(define (get-precio-minimo libro) (caddr libro))
(define (get-total-vendidos libro) (caddddr libro))
(define (get-numero-paginas libro) (cadddddr libro))


;; b) Registrar un nuevo autor en el sistema (5 ptos)

;; Retorna la lista actualizada de autores, incluyendo el nuevo autor agregado

(define (registro-autor nombre libros-publicados autores)
  (if (null? autores)
      (cons (autor nombre libros-publicados) null)
      (cons (car autores) (registro-autor nombre libros-publicados (cdr autores)))
      )
  )

;; Luego, para tener el puntaje completo, debe ingresar esta nueva lista de autores en el TDA libreria

(define (agregar-nuevo-autor libreria-actual nombre libros-publicados)
  (set-lista-autores libreria-actual
                     (registro-autor nombre
                                     libros-publicados
                                     (get-lista-autores libreria-actual))))


;; c) Permitir al autor registrar un nuevo libro de su autoría en el sistema (5 ptos)

(define registro-libro
  (lambda (nombre-autor nombre-libro precio-minimo precio-sugerido total-vendidos numero-paginas tags libros-publicados)
    (if (null? libros-publicados)
        (cons (libro nombre-autor
                     nombre-libro
                     precio-minimo
                     precio-sugerido
                     total-vendidos
                     numero-paginas
                     tags) null)
        (cons (car libros-publicados)
              (registro-libro nombre-autor
                              nombre-libro
                              precio-minimo
                              precio-sugerido
                              total-vendidos
                              numero-paginas
                              tags
                              (cdr libros-publicados))))))

;; Luego, para tener el puntaje completo, el autor actualizado debe ingresarse en el sistema (libreria)
;; Es decir, creamos una nueva libreria con el constructor apropiado, pasando como argumento una lista actualizada de libros 

(define (agregar-nuevo-autor libreria-actual nombre libros-publicados)
  (set-libros-publicados libreria-actual
                         (registro-libro nombre-autor
                                         nombre-libro
                                         precio-minimo
                                         precio-sugerido
                                         total-vendidos
                                         numero-paginas tags
                                         (get-libros-publicados libreria-actual))))


;; d) Permitir a un usuario comprar (adquirir) un libro de la lista de libros existentes en el sistema (5 ptos)

;; Definir funcion de agregar (1 pto)
(define (agregar lista elemento)
  (if (null? lista)
      (cons elemento null)
      (cons (car lista) (agregar (cdr lista) elemento)))
  )

;; Definir funcion que verifica si el elemento se encuentra en la lista (1 pto)
(define (contiene? lista elemento)
  (cond
    [(null? lista) #f]
    [(equal? (car lista) elemento) #t]
    [else (contiene? (cdr lista) elemento)]))

;; Funcion de adquirir el libro (3 ptos)

;; Sin cambiar la cantidad de libros vendidos (2 ptos)
(define (adquirir-libro usuario-comprador libro-a-adquirir sistema)
  (cond
    [(contiene? sistema libro-a-adquirir)
     (usuario (get-username usuario-comprador)
              (agregar (get-libros-comprados usuario-comprador) libro-a-adquirir))]
    [usuario-comprador]))

;; Considerando cambiar la cantidad de libros vendidos
(define (adquirir-libro usuario-comprador libro-a-adquirir sistema)
  (cond
    [(contiene? sistema libro-a-adquirir)
     (usuario (get-username usuario-comprador)
              (agregar (get-libros-comprados usuario-comprador)
                       (libro (+ 1 (get-total-vendidos libro-a-adquirir) total-vendidos) ; Constructor de libro pero con el totalvendidos + 1
                              )
                       ))]
    [usuario-comprador]))

;; e)Implemente las funciones necesarias que permitan filtrar libros en el sistema de acuerdo a (13 ptos)
;;; i) precio minimo
;;; ii) precio maximo
;;; iii) numero de paginas
;;; iv) un valor entre el precio minimo y el precio maximo

; Esto se puede abordar creando una función de filtro que reciba los criterios

;; Opcion 1 de un filtro
(define mi-filtro
  (lambda (criterio lista)
    (cond
      [(null? lista) null]
      [(criterio(car lista))
       (cons (car lista) (mi-filtro criterio (cdr lista)))]
      [else (mi-filtro criterio (cdr lista))])))

;; Opcion 2 de un filtro
(define (filtro-libros libros criterio)
  (if (null? libros)
      null
      (if (criterio (car libros))
          (cons (car libros) (filtro-libros (cdr libros) criterio))
          (filtro-libros (cdr libros) criterio))))

;;; i) precio minimo
;; Retornar todos los libros cuyo precio sea mayor al precio minimo

(define (criterio-precio-min libro min)
  (if (>= (get-precio-minimo libro) min)
      #t
      #f))


;;; ii) precio maximo

(define (criterio-precio-max libro max)
  (if (<= (get-precio-minimo libro) max)
      #t
      #f))

;;; iii) numero de paginas

;; Acá queda a elección del estudiante como quiere filtrarlo.
;; Puede ser: filtrar los libros que tengan una cantidad menor, o mayor, o igual
(define (criterio-max-numero-paginas libro numero-paginas)
  (if (<= (get-numero-paginas libro) max)
      #t
      #f))


;;; iv) un valor entre el precio minimo y el precio maximo

(define (criterio-precio-min-max libro min max)
  (if (and (<= (get-precio-minimo libro) max)
           (>= (get-precio-minimo libro) min))
      #t
      #f))

