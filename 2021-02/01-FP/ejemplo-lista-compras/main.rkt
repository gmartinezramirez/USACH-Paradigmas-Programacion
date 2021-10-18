#lang racket

(require "tda/articulo.rkt")
(require "tda/lista-compra.rkt")

;; Lista de compras ;;

(display "Ejemplo lista de compras") (newline)
(display "------------------------") (newline)


;; Creando una lista inicial para poder operar ;;
(define mi-lista-inicial
  (lista-articulos (articulo 0 "tv samsung" 1000)
                   (articulo 1 "notebook dell" 30000)))

(display "Lista inicial de compras: ") (newline)
mi-lista-inicial

;; Convertiendo a string la lista inicial ;;
(display "Conversion a string de la lista inicial de compras") (newline)
(lst-articulo->string mi-lista-inicial)

;; Agregando articulos a la lista de articulos con id autoincremental ;;
(display "Agregando articulos") (newline)

(define mi-lista-2
  (add-articulo-autoincrement-id mi-lista-inicial "teclado Razer" 800))

mi-lista-2

(define mi-lista-3
  (add-articulo-autoincrement-id mi-lista-2 "mouse Razer" 700))

mi-lista-3

(define mi-lista-4
  (add-articulo-autoincrement-id mi-lista-3 "Nvidia RTX3080" 9999))

mi-lista-4

;; Convertiendo a string la ultima lista que se mostro ;;
(display "Conversion a string de la ultima version de la lista") (newline)

(lst-articulo->string mi-lista-4)

;; Filtrar la ultima lista de acuerdo al precio de los articulos ;;
(display "Filtrar los articulos cuyos precios sean mayor a 1000") (newline)

(define articulo-precio-filtrado-1
  (get-articulos-con-precio-mayor-a mi-lista-4 1000))

articulo-precio-filtrado-1

;; Sumando la los precios de la lista de productos filtrados ;;
(display "Sumando la los precios de la lista de productos filtrados por el precio") (newline)

(define suma-precio-lista-filtrada
  (obtener-suma-de-todos-los-precios articulo-precio-filtrado-1))

suma-precio-lista-filtrada

(display "Sumando la los precios de la lista de productos no filtrada, la ultima lista") (newline)
(define suma-precio-lista-todos-productos
  (obtener-suma-de-todos-los-precios mi-lista-4))

suma-precio-lista-todos-productos
