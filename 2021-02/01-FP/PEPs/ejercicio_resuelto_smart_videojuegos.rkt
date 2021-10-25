#lang racket

;; Pregunta tipo PEP

;; Pregunta 1
; Diseñe una representación de él o los TDAs vinculados al registro de juegos
; Luego implemente sus constructores y funciones de pertenencia.

; TIP: NO SE CENTREN EN VALIDACIONES

;;; Respuesta

;; En la capa de constructor y selector no usar comentarios, a menos que sea pedido
;; Esto ya que es rebundante comentar dichas capas
;; Constructores

(define juego
  (lambda (id nombre plataforma precio calificacion)
    (list id nombre plataforma precio calificacion)))

(define (lista-juegos . juegos) juegos)

;; Selectores
(define (get-id juego) (car juego))
(define (get-nombre juego) (cadr juego))
(define (get-plataforma juego) (caddr juego))
(define (get-precio juego) (cadddr juego))
(define (get-calificacion juego) (cadddr (cdr juego)))

;; Pregunta 2
; Implemente una función que permita añadir nuevos juegos al registro de juegos de SMart.

;; Descripción: Función que recibe los datos que corresponden a un juego y lo agrega a una lista de juego
;;              preexistente. En caso de que esta lista se encuentre vacia, se agrega como primer elemento
;; Dom: id number, plataforma str, precio number, calificacion number, lista-juegos lista(juegos)
;; Rec: lista de videojuegos
;; Tipo de recursión: Recursión natural
;; Ejemplo de uso:
;; (define lista-juegos-con-nuevo-juego
;;  (agregar-nuevo-juego "11249818-k" 2 "10-ene-21" "15-feb-21" #t lista-juegos-actual))
;; Nota: Esto no considera que hayan duplicados o se ingrese juegos ya existentes
(define agregar-nuevo-juego
  (lambda (id nombre plataforma precio calificacion lista-juegos)
    (cond
      [(null? lista-juegos)
       (cons (juego id nombre plataforma precio calificacion) null)]
      [else (cons (car lista-juegos)
                  (agregar-nuevo-juego id nombre plataforma precio calificacion (cdr lista-juegos)))])))

; Ejemplos
(define juego1
  (juego 0 "Doom" "PC" 40000 10))

(define juego2
  (juego 1 "Loom" "PC" 1000 5))

(define juego3
  (juego 2 "Counter Strike" "PC" 500 8))

(define juego4
  (juego 3 "Halo" "Xbox One" 30000 3))

(define juego5
  (juego 4 "Mortal Kombat Usach" "Switch" 1000000 10))

(define lista-juegos-ejemplo
  (lista-juegos juego1 juego2 juego3 juego4 juego5))

lista-juegos-ejemplo

(define lista-juego-ejemplo-con-nuevo-juego
  (agregar-nuevo-juego 99 "God of War 5" "PS5" 60000 1 lista-juegos-ejemplo))

lista-juego-ejemplo-con-nuevo-juego

; Otra forma de agregar items a una lista, usando el constructor
; OJO: con esto cambiaria la forma de usar el filtro
;(define lista-juego-ejemplo-con-otro-nuevo-juego
;  (lista-juegos lista-juego-ejemplo-con-nuevo-juego juego4))
;
;lista-juego-ejemplo-con-otro-nuevo-juego

;; Pregunta 3
; A partir de los TDAs construidos en las preguntas 1 y 2, se solicita implementar las siguientes funciones que permitan lo siguiente:
; 3 a (5 pts) Recuperar todos los videojuegos que cumplan con un nombre determinado.

;; Descripción: Función que actua como un filtro en base a una función predicado (booleano)
;; Dom: predicado (función que retorna un booleano), lista a filtrar
;; Rec: lista
;; Tipo de recursión: Recursión natural
;; Ejemplo de uso:
;; (mi-filtro (mi-funcion-predicado argumento) lista-juegos)
;; Referencia: Función vista en clase del profesor Gonzalo Martinez
(define (mi-filtro pred lista)
  (cond
    [(null? lista) '()]
    [(pred (car lista))
     (cons (car lista) (mi-filtro pred (cdr lista)))]
    [else (mi-filtro pred (cdr lista))]))

;; Descripción: Función predicado currificada que devuelve #t si el nombre ingresado coincide con el videojuego
;;              caso contrario devuelve #f
;; Dom: nombre str, juegos (lista de juegos)
;; Rec: boolean
;; Ejemplo de uso:
;; ((es-mismo-nombre? "Prince of Persia") lista-juego-ejemplo)
(define es-mismo-nombre?
  (lambda (nombre)
    (lambda (juegos)
      (cond
        [(eq? nombre (get-nombre juegos)) #t]
        [else #f]))))

; Ejemplos
(mi-filtro (es-mismo-nombre? "Doom") lista-juego-ejemplo-con-nuevo-juego)

; 3 b Recuperar todos los juegos cuyo precio se encuentre en un rango determinado (min y max)

;; Descripción: Función predicado currificada que devuelve #t si el juego se encuentra dentro del rango
;;              caso contrario devuelve #t
;; Dom:  juegos (lista de juegos)
;; Rec: boolean
;; Ejemplo de uso:
;; (es-no-retornado? lista-juego-ejemplo)
(define precio-se-encuentra-dentro-de-rango?
  (lambda (min max)
    (lambda (juegos)
      (cond
        [(and (<= min (get-precio juegos))
              (>= max (get-precio juegos))) #t]
        [else #f]))))

; Ejemplo
(mi-filtro (precio-se-encuentra-dentro-de-rango? 10 40000) lista-juego-ejemplo-con-nuevo-juego)

;; 3 c Implemente el mismo criterio pero de forma currificada

(define precio-se-encuentra-dentro-de-rango-curry?
  (lambda (min)
    (lambda (max)
      (lambda (juegos)
        (cond
          [(and (<= min (get-precio juegos))
                (>= max (get-precio juegos))) #t]
          [else #f])))))

; Ejemplo
(mi-filtro ((precio-se-encuentra-dentro-de-rango-curry? 10) 40000) lista-juego-ejemplo-con-nuevo-juego)

;; 3 d Recuperar todos los videojuegos de una plataforma en específico

(define criterio-seleccion-por-plataforma
  (lambda (plataforma)
    (lambda (juegos)
      (cond
        [(eq? plataforma (get-plataforma juegos)) #t]
        [else #f]))))

; 3 e Recuperar todos los juegos de una plataforma que se encuentren bajo un rango de calificación (nota min - nota max).
; Aca se utilizan 2 criterios de filtro, la plataforma y min-max

(define plataforma-calificacion-se-encuentra-dentro-de-rango?
  (lambda (min max plataforma)
    (lambda (juegos)
      (cond
        [(and (eq? plataforma (get-plataforma juegos))
              (<= min (get-calificacion juegos))
              (>= max (get-calificacion juegos))) #t]
        [else #f]))))

; Ejemplo
(mi-filtro (plataforma-calificacion-se-encuentra-dentro-de-rango? 1 8 "PC") lista-juego-ejemplo-con-nuevo-juego)

;; 3 f implemente los mismos criterios anteriores utilizando currificación

(define plataforma-calificacion-se-encuentra-dentro-de-rango-curry?
  (lambda (min)
    (lambda (max)
      (lambda (plataforma)
        (lambda (juegos)
          (cond
            [(and (eq? plataforma (get-plataforma juegos))
                  (<= min (get-calificacion juegos))
                  (>= max (get-calificacion juegos))) #t]
            [else #f]))))))

(mi-filtro (((plataforma-calificacion-se-encuentra-dentro-de-rango-curry? 1) 8) "PC") lista-juego-ejemplo-con-nuevo-juego)


;; 4 Implemente una función que aplique un descuento de X en todos los juegos de cierta plataforma

;; Si usamos Map y Filter por separado, se va a estropear, vean lo que sucede
;; No tomar directamente el map, hay que modificarlo
(define mi-map
  (lambda (funcion lista)
    (cond
      [(null? lista) null]
      [else (cons (funcion(car lista)) (mi-map funcion(cdr lista)))]
      )))

(define funcion-descuento
  (lambda (juego)
    (- (get-precio juego) 100)))

(define solo-juegos-seleccionados
  (mi-filtro (criterio-seleccion-por-plataforma "PC") lista-juego-ejemplo-con-nuevo-juego))

; Esto solo va a retornar la lista de precios
(mi-map funcion-descuento solo-juegos-seleccionados)

;; 4 Implemente una función que aplique un descuento de X en todos los juegos de cierta plataforma
; La solución es dejar todo en una misma función
; Esta es la solución correcta. Hacer esto
(define funcion-a-aplicar
  (lambda (precio)
    (- precio 100)))

(define criterio-plataforma
  (lambda (juego)
    (cond
      [(eq? "PC" (get-plataforma juego)) #t]
      [else #f])))

(define (aplicar-funcion-segun-criterio lista-juegos funcion criterio)
  (if (null? lista-juegos) null
      (if (criterio (car lista-juegos))
          (cons (juego (get-id (car lista-juegos))
                       (get-nombre (car lista-juegos))
                       (get-plataforma (car lista-juegos))
                       (funcion (get-precio (car lista-juegos)))
                       (get-calificacion (car lista-juegos)))
                (aplicar-funcion-segun-criterio (cdr lista-juegos) funcion criterio))
          (aplicar-funcion-segun-criterio (cdr lista-juegos) funcion criterio))))

(aplicar-funcion-segun-criterio lista-juegos-ejemplo funcion-a-aplicar criterio-plataforma)

; Usando cond
;(define aplicar-funcion-segun-criterio
;  (lambda (lista-juegos funcion criterio)
;    (cond
;      [(null? lista-juegos) null]
;      [(criterio (car lista-juegos))
;       (cons (juego (get-id (car lista-juegos))
;                    (get-nombre (car lista-juegos))
;                    (get-plataforma (car lista-juegos))
;                    (funcion (get-precio (car lista-juegos)))
;                    (get-calificacion (car lista-juegos)))
;             (aplicar-funcion-segun-criterio (cdr lista-juegos) funcion criterio))]
;      [aplicar-funcion-segun-criterio (cdr lista-juegos) funcion criterio])))

