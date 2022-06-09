#lang racket

;; a)

(define get-trip-data
  (list "something" "something2"))

; Descripción:
; Dom:
; Rec:
(define conductor
  (lambda (id correo nombre viajes)
    (list id correo nombre viajes)))

; Descripción:
; Dom:
; Rec:
(define cliente
  (lambda (correo)
    (list correo)))

; Descripción:
; Dom:
; Rec:
(define viaje
  (lambda (id_viaje correo_conductor correo_cliente inicio destino total_km duracion_minutos precio)
    (list id_viaje correo_conductor
          correo_cliente
          inicio destino
          total_km
          duracion_minutos
          precio)))



;; b)

; Descripción:
; Dom:
; Rec:
(define get-total-km
  (lambda (start finish)
    (car get-trip-data(start finish))))

;; c)

; Descripción:
; Dom:
; Rec:
(define get-total-price
  (lambda (start finish)
    (car (reverse get-trip-data(start finish)))))

;; c) Un conductor acepta
;; Pasos:
;; Precondición: crear un conductor con una lista de viajes vacio

;(define conductor-ejemplo
;  (conductor 0 "miconductor@gmail.com" "miconductor" (list)))

;; Precondición: un cliente preexistente

;(define cliente-ejemplo
;  (cliente "micliente@gmail.com"))

(define conductor-acepta-viaje
  (lambda (un-conductor un-cliente inicio destino)
    (set-new-viaje-conductor un-conductor un-cliente inicio destino)))

(define set-new-viaje-conductor
  (lambda (un-conductor un-cliente inicio destino)
    (conductor (get-id-conductor un-conductor)
               (get-mail-conductor un-conductor)
               (add-new-viaje
                (create-viaje un-conductor un-cliente inicio destino)
                (get-viajes un-conductor)))))

(define add-new-viaje
  (lambda (un-viaje viajes)
    (cons un-viaje viajes)))

(define create-viaje
  (lambda (un-conductor un-cliente inicio destino)
    (viaje 0 (get-conductor-mail un-conductor)
           (get-cliente-mail un-cliente)
           (get-km inicio destino)
           (get-duracion inicio destino)
           (get-precio inicio destino))))

; e)

;; a) Precio minimo
(define precio-es-mayor-a?
  (lambda (precio)
    (lambda (viaje)
      (cond
        [(> precio (get-precio viaje)) #t]
        [else #f]))))

(filter (precio-es-mayor-a? 100) (get-viajes conductor))

;; b) Precio maximo
(define precio-es-menor-a?
  (lambda (precio)
    (lambda (viaje)
      (cond
        [(< precio (get-precio viaje)) #t]
        [else #f]))))

(filter (precio-es-menor-a? 100) (get-viajes conductor))

;; c) distancia entre minimo y máximo
(define viaje-se-encuentra-dentro-de-rango-km?
  (lambda (min)
    (lambda (max)
      (lambda (articulo)
        (cond
          [(and (<= min (get-precio articulo))
                (>= max (get-precio articulo))) #t]
          [else #f])))))

(mi-filtro ((viaje-se-encuentra-dentro-de-rango-km? 100) 400) (get-viajes conductor))



