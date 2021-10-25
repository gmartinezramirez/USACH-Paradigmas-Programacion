#lang racket

;a) Representación TDAs
(define (pelicula id nombre duracion año tags precio)
  (list id nombre duracion año tags precio))

(define (usuario rut username password preferencias cartera peliculas)
  (list rut username password preferencias cartera peliculas))

(define (lista-peliculas . peliculas) peliculas)

(define (lista-usuarios . usuarios) usuarios)

(define (get-id pelicula) (car pelicula))
(define (get-nombre pelicula) (cadr pelicula))
(define (get-duracion pelicula) (caddr pelicula))
(define (get-año pelicula) (cadddr pelicula))
(define (get-etiquetas pelicula) (cadddr (cdr pelicula)))
(define (get-precio pelicula) (cadddr (cdr (cdr pelicula))))

(define (get-rut usuario) (car usuario))
(define (get-username usuario) (cadr usuario))
(define (get-password usuario) (caddr usuario))
(define (get-preferencias usuario) (cadddr usuario))
(define (get-cartera usuario) (cadddr (cdr usuario)))
(define (get-peliculas usuario) (cadddr (cdr (cdr usuario))))

(define pelicula-durodematar
  (pelicula 0 "duro de matar 90" 180 1989 "accion" 100)) 

pelicula-durodematar

(define peliculas-usuario-ejemplo
  (lista-peliculas (pelicula 0 "duro de matar 1" 180 1989 "accion" 100))) 

peliculas-usuario-ejemplo

(define usuario-bruce-willis
  (usuario "1-K" "bruce" "passwordbruce" "accion" 99999 peliculas-usuario-ejemplo))

usuario-bruce-willis

(define lista-usuarios-inicial
  (lista-usuarios (usuario "1111-1" "username1" "password1" "accion" 9999 "peliculas")
                  (usuario "2222-2" "username2" "password2" "accion" 9999 "peliculas")))

;b) Registrar nuevo usuario
;; Agrega usuario por cola (tail)
(define (registro rut username password lista-usuarios)
  (if (null? lista-usuarios)
      (cons (usuario rut username password "" 0 null) null)
      (cons (car lista-usuarios) (registro rut username password (cdr lista-usuarios)))))

(registro "18945587-3" "username99" "password99" lista-usuarios-inicial)

;c) Comprar película
(define (agregar lista elem)
  (if (null? lista)
      (cons elem null)
      (cons (car lista) (agregar (cdr lista) elem))))

(define agrega-elemento
  (lambda(lista elemento)
    (cons elemento lista)))

(define (comprar usuario-comprador pelicula)
  (if (<= (get-precio pelicula) (get-cartera usuario-comprador))
      (usuario (get-rut usuario-comprador)
               (get-username usuario-comprador)
               (get-password usuario-comprador)
               (get-preferencias usuario-comprador)
               (- (get-cartera usuario-comprador) (get-precio pelicula))
               (agregar (get-peliculas usuario-comprador) pelicula))
      usuario))

(comprar usuario-bruce-willis pelicula-durodematar)

;d) Seleccionar películas segun criterio C

(define (mi-filtro pred lista)
  (cond
    [(null? lista) '()]
    [(pred (car lista))
     (cons (car lista) (mi-filtro pred (cdr lista)))]
    [else (mi-filtro pred (cdr lista))]))

; Otra opcion
;(define (filtrar-peliculas lista-peliculas c)
;    (if (null? lista-peliculas)
;        null
;        (if (c (car lista-peliculas))
;            (cons (car lista-peliculas) (filtrar-peliculas (cdr lista-peliculas) c))
;            (filtrar-peliculas (cdr filtrar-peliculas) c))))

;e) Criterios para filtrar
; Duracion peli entre min y max

(define duracion-pelicula-cumple-rango?
  (lambda (min max)
    (lambda (pelicula)
      (cond
        [(and (<= min (get-duracion pelicula))
              (>= max (get-duracion pelicula))) #t]
        [else #f]))))

(mi-filtro (duracion-pelicula-cumple-rango? 10 100) lista-peliculas)

; Otra forma
;(define (criterio-duracion-pelicula pelicula min max)
;    (if (and (<= (get-duracion pelicula) max) (>= (get-duracion pelicula) min))
;        #t
;        #f
;)

; Etiqueta

;(define (etiquetaPelicula pelicula listaEtiquetas)
;    (aux (getEtiquetas pelicula) listaEtiquetas)
;)

;(define (aux etiquetasPelicula listaEtiquetas)
;    (if (null? listaEtiquetas)
;     #f
;        (if (null? etiquetasPelicula)
;            #t
;        (if (eqv? (car etiquetasPelicula) (car (listaEtiquetas)))
;            (aux (cdr etiquetasPelicula) (cdr listaEtiquetas))
;            (aux etiquetaPelicula (cdr listaEtiquetas))
;    )
;)


;f) Aplicar rebaja según función F y criterio C

(define funcion-a-aplicar
  (lambda (precio)
    (- precio 30)))

(define criterio-etiqueta
  (lambda (pelicula)
    (cond
      [(eq? "accion" (get-etiquetas pelicula)) #t]
      [else #f])))


(define (aplicar-funcion-segun-criterio peliculas funcion criterio)
  (if (null? peliculas) null
      (if (criterio (car peliculas))
          (cons (pelicula (get-id (car peliculas))
                          (get-nombre (car peliculas))
                          (get-duracion (car peliculas))
                          (get-año (car peliculas))
                          (get-etiquetas (car peliculas))
                          (funcion (get-precio (car peliculas))))))
      (aplicar-funcion-segun-criterio (cdr peliculas) funcion criterio))
  (aplicar-funcion-segun-criterio (cdr peliculas) funcion criterio))

(aplicar-funcion-segun-criterio (get-peliculas usuario-bruce-willis) funcion-a-aplicar criterio-etiqueta)

; Otra forma es usar map

;(define (mi-map funcion lista)
;  (cond
;    [(null? lista) null]
;    [else (cons (funcion (car lista))
;                (mi-map funcion (cdr lista)))]))

;(define aplicar-descuento-al-articulo
;  (lambda (descuento)
;    (lambda (articulo-a-cambiar)
;      (articulo (get-id articulo-a-cambiar)
;               (get-nombre articulo-a-cambiar)
;                (get-tipo articulo-a-cambiar)
;                (- (get-precio articulo-a-cambiar) descuento)))))

;(mi-map (aplicar-descuento-al-articulo 10) lista-inicial-articulos)

;; Funcion f que se aplica segun se cumpla un criterio C
;; Cuando aplicams una funcion F a todos los elementos de una lista: MAP
;; Sabemos que cumplir un Criterio C, signfica: FILTRAR BAJO UN CRITERIO (PREDICADO)