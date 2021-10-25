#lang racket

#lang racket

;a) Representación TDAs
(define (pelicula id nombre duracion anio tags precio)
  (list id nombre duracion anio tags precio))

(define (usuario rut username password preferencias cartera peliculas)
  (list rut username password preferencias cartera peliculas))

(define (listaPeliculas . peliculas) peliculas)

(define (listaUsuarios . usuarios) usuarios)

(define (getId pelicula) (car pelicula))
(define (getNombre pelicula) (cadr pelicula))
(define (getDuracion pelicula) (caddr pelicula))
(define (getAnio pelicula) (cadddr pelicula))
(define (getEtiquetas pelicula) (caddddr pelicula))
(define (getPrecio pelicula) (cadddddr pelicula))

(define (getRut usuario) (car usuario))
(define (getUsername usuario) (cadr usuario))
(define (getPassword usuario) (caddr usuario))
(define (getPreferencias usuario) (cadddr usuario))
(define (getCartera usuario) (caddddr usuario))
(define (getPeliculas usuario) (cadddddr usuario))


;b) Registrar nuevo usuario
(define (registro rut username password listaUsuarios)
    (if (null? listaUsuarios)
        (cons (usuario rut username password ‘’ 0 null) null)
        (cons (car listaUsuarios) (registro rut username password (cdr listaUsuarios)))
    )
)

;c) Comprar película
(define (agregar lista elem)
    (if (null? lista)
        (cons elem null)
        (cons (car lista) (agregar (cdr lista) elem))
    )
)

(define (comprar usuario pelicula)
    (if (<= (getPrecio pelicula) (getCartera usuario))
        (usuario (getRut usuario)
            (getUsername usuario)
            (getPassword usuario)
            (getPreferencias usuario)
            (- (getCartera usuario) (getPrecio pelicula)
            (agregar (getPeliculas usuario) pelicula)
        )
        usuario
    )
)

;d) Seleccionar películas segun criterio C
(define (filtroPeliculas listaPeliculas c)
    (if (null? listaPeliculas)
        null
        (if (c (car listaPeliculas))
            (cons (car listaPeliculas) (filtroPeliculas (cdr listaPeliculas) c))
            (filtroPeliculas (cdr listaPeliculas) c)
        )
    )
)

;e) Criterios para filtrar
(define (duracionPelicula pelicula min max)
    (if (and (<= (getDuracion pelicula) max) (>= (getDuracion pelicula) min))
        #t
        #f
)

(define (etiquetaPelicula pelicula listaEtiquetas)
    (aux (getEtiquetas pelicula) listaEtiquetas)
)

(define (aux etiquetasPelicula listaEtiquetas)
    (if (null? listaEtiquetas)
     #f
        (if (null? etiquetasPelicula)
            #t
        (if (eqv? (car etiquetasPelicula) (car (listaEtiquetas)))
            (aux (cdr etiquetasPelicula) (cdr listaEtiquetas))
            (aux etiquetaPelicula (cdr listaEtiquetas))
    )
)


;f) Aplicar rebaja según función F y criterio C
(define (aplicarRebaja listaPeliculas f c)
    (if (null? listaPeliculas)
        null
        (if (c (car listaPeliculas))
            (cons (pelicula (getId (car listaPeliculas))
                (getNombre (car listaPeliculas))
                (getDuracion (car listaPeliculas))
                (getAnio (car listaPeliculas))
                (getEtiquetas (car listaPeliculas))
                (f (getPrecio (car listaPeliculas)))
                (aplicarRebaja (cdr listaPeliculas))
            )
            (aplicarRebaja (cdr listaPeliculas))
         )
    )
)
