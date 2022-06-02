#lang racket

;; Articulo
(define articulo
  (lambda (id precio nombre)
    (list id precio nombre)))


;; TDA Lista de articulos
(define (lista-articulos . articulos) articulos)


; Ejemplo
(define lista-inicial-articulos
  (lista-articulos (articulo 0 1000 "PS5")
                   (articulo 1 2000 "XboxOne")
                   (articulo 2 5000 "Guitarra")))

;;
;; (cons articulo0 (cons art1 (cons art2 (cons art3 null)))
;; (art0 . (art1 . (art2 . (art3 null))

;(define miLista2
;  (filter pred lista-inicial-articulos))

;(define miLista3
;  (map funcion lista-inicial-articulos))