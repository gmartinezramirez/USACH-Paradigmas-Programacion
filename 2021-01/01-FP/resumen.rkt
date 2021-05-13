#lang racket

;; Resumen de Paradigma Funcional aplicado

;; TDA Articulo
(define articulo
  (lambda (id nombre tipo precio)
    (list id nombre tipo precio)))

; Capa selectora
(define (get-id articulo) (car articulo))
(define (get-nombre articulo) (cadr articulo))
(define (get-tipo articulo) (caddr articulo))
(define (get-precio articulo) (cadddr articulo))

;(define (get-elemento5 tda) (cadddr (cdr tda)))
;(define (get-elemento6 tda) (cadddr (cdr (cdr tda))))
;(define (get-elemento7 tda) (cadddr (cdr (cdr (cdr tda)))))
;(define (get-elemento8 tda) (cadddr (cdr (cdr (cdr (cdr tda))))))
;(define (get-elemento9 tda) (cadddr (cdr (cdr (cdr (cdr (cdr tda)))))))

; Capa modificadora
(define set-precio
  (lambda (articulo-a-modificar nuevo-precio)
    (articulo (get-id articulo-a-modificar)
              (get-nombre articulo-a-modificar)
              (get-tipo articulo-a-modificar)
              nuevo-precio)))

;; TDA Lista de articulos
(define (lista-articulos . articulos) articulos)

; Capa modificadora
(define set-precio-articulo-lista
  (lambda (articulos nuevo-precio)
    (articulo (get-id (car articulos))
              (get-nombre (car articulos))
              (get-tipo (car articulos))
              (set-precio (car articulos) nuevo-precio))))

; Ejemplo
(define lista-inicial-articulos
  (lista-articulos (articulo 0 "tv" "tecnologia" 1000)
                   (articulo 1 "notebook dell" "tecnologia" 30000)
                   (articulo 2 "manzana" "fruta" 500)
                   (articulo 3 "kiwi" "fruta" 70)
                   (articulo 4 "zapato" "calzado" 90)))

lista-inicial-articulos

;; Agregar un nuevo articulo a la lista de articulos

;; Nota: No considera el caso de duplicados
(define agregar-nuevo-articulo
  (lambda (id nombre tipo precio lista-articulos)
    (cond
      [(null? lista-articulos)
       (cons (articulo id nombre tipo precio) null)]
      [else (cons (car lista-articulos)
                  (agregar-nuevo-articulo id nombre tipo precio (cdr lista-articulos)))])))

;; Tip: La funcion estandar para agregar elementos a una lista
(define (agregar lista elem)
  (if (null? lista)
      (cons elem null)
      (cons (car lista) (agregar (cdr lista) elem))))

;; Otra forma para agregar elementos a la lista podria ser
(define (agregar-articulo lista-articulos articulo)
  (if (null? lista-articulos) (cons articulo null)
      (cons (car lista-articulos)
            (agregar-articulo (cdr lista-articulos) articulo))))

; Ejemplo
(define articulo-tablet
  (articulo 99 "tablet" "tecnologia" 999))

(define lista-articulos-nuevo-elemento
  (lista-articulos lista-inicial-articulos articulo-tablet)) 

lista-articulos-nuevo-elemento

;; Ingresar el precio de un articulo de acuerdo a su nombre
(define modificar-lista-si-precio-es-mismo
  (lambda (nombre nuevo-precio lista-articulos)
    (cond
      [(null? lista-articulos) lista-articulos]
      [(eq? (get-nombre (car lista-articulos)) nombre)
       (cons (set-precio-articulo-lista lista-articulos nuevo-precio)
             (cdr lista-articulos))]
      [else modificar-lista-si-precio-es-mismo nombre nuevo-precio (cdr lista-articulos)])))

(define lista-precio-modificado
  (modificar-lista-si-precio-es-mismo "kiwi" 99999 lista-inicial-articulos))

lista-precio-modificado


 ;; Aplicar un descuento de 100 en todos los articulos de la lista de articulos

;; Map es una función que te permite transformar los elementos de una lista y
;; que devuelve una nueva lista con los elementos transformados.

;; Los elementos resultantes no tienen por qué ser del mismo tipo que los originales.

;; Map finalmente retorna una nueva lista

;; Descripción: Función que aplica una función fn a todos y cada uno de los elementos
;;              de una lista lst
;; Dom: Función a aplicar a una colección de datos <función>,
;;      Lista de datos <lista>
;; Rec: Nueva lista con cada elemento
;; Tipo de recursión: Natural
(define (mi-map funcion lista)
  (cond
    [(null? lista) null]
    [else (cons (funcion (car lista))
                (mi-map funcion (cdr lista)))]))

(define aplicar-descuento-al-articulo
  (lambda (descuento)
    (lambda (articulo-a-cambiar)
      (articulo (get-id articulo-a-cambiar)
                (get-nombre articulo-a-cambiar)
                (get-tipo articulo-a-cambiar)
                (- (get-precio articulo-a-cambiar) descuento)))))

(mi-map (aplicar-descuento-al-articulo 10) lista-inicial-articulos)


;; Recuperar todos los articulos que tengan un precio entre un minimo y un maximo

;; Referencia: Función vista en clase del profesor Gonzalo Martinez
(define (mi-filtro pred lista)
  (cond
    [(null? lista) '()]
    [(pred (car lista))
     (cons (car lista) (mi-filtro pred (cdr lista)))]
    [else (mi-filtro pred (cdr lista))]))

(define articulo-se-encuentra-dentro-de-rango-precio?
  (lambda (min max)
    (lambda (articulo)
      (cond
        [(and (<= min (get-precio articulo))
              (>= max (get-precio articulo))) #t]
        [else #f]))))

(mi-filtro (articulo-se-encuentra-dentro-de-rango-precio? 20 400) lista-inicial-articulos)

;; Versión currificada
(define articulo-se-encuentra-dentro-de-rango-precio-curry?
  (lambda (min)
    (lambda (max)
      (lambda (articulo)
        (cond
          [(and (<= min (get-precio articulo))
                (>= max (get-precio articulo))) #t]
          [else #f])))))

(mi-filtro ((articulo-se-encuentra-dentro-de-rango-precio-curry? 20) 400) lista-inicial-articulos)

;; Recuperar todos los articulos de un cierto tipo, por ejemplo: "tecnologia"
(define articulo-es-del-tipo?
  (lambda (tipo)
    (lambda (articulo)
      (cond
        [(eq? tipo (get-tipo articulo)) #t]
        [else #f]))))

(mi-filtro (articulo-es-del-tipo? "tecnologia") lista-inicial-articulos)

;; Recuperar todos los articulos de un cierto tipo, por ejemplo: "tecnologia" y que además se encuentren en cierto rango de precio minimo y máximo
(define articulo-es-del-tipo-y-esta-en-rango-precio?
  (lambda (min max tipo)
    (lambda (articulo)
      (cond
        [(and (eq? tipo (get-tipo articulo))
              (<= min (get-precio articulo))
              (>= max (get-precio articulo))) #t]
        [else #f]))))

(mi-filtro (articulo-es-del-tipo-y-esta-en-rango-precio? 10 1000 "tecnologia") lista-inicial-articulos)

;; Versión currificada
(define articulo-es-del-tipo-y-esta-en-rango-precio-curry?
  (lambda (min)
    (lambda (max)
      (lambda (tipo)
        (lambda (articulo)
          (cond
            [(and (eq? tipo (get-tipo articulo))
                  (<= min (get-precio articulo))
                  (>= max (get-precio articulo))) #t]
            [else #f]))))))

(mi-filtro (((articulo-es-del-tipo-y-esta-en-rango-precio-curry? 10) 1000) "tecnologia") lista-inicial-articulos)

;; Implemente una función F que aplique un descuento de X en todos los articulos de cierta categoria
;; Esto aplica a problemas del tipo: aplicar funcion F según criterio C

; Acá podemos mezclar el uso de la función Map (mi-map) con Filter (mi-filtro)

(define aplicar-descuento-en-articulos-de-cierta-categoria
  (lambda (descuento categoria lista-articulos)
    (mi-map (aplicar-descuento-al-articulo descuento)
            (mi-filtro (articulo-es-del-tipo? categoria) lista-articulos))))

(aplicar-descuento-en-articulos-de-cierta-categoria 30 "tecnologia" lista-inicial-articulos)

;; Versión currificada

(define aplicar-descuento-en-articulos-de-cierta-categoria-curry
  (lambda (descuento)
    (lambda (categoria)
      (lambda (lista-articulos)
        (mi-map (aplicar-descuento-al-articulo descuento)
                (mi-filtro (articulo-es-del-tipo? categoria) lista-articulos))))))

(((aplicar-descuento-en-articulos-de-cierta-categoria-curry 30) "tecnologia") lista-inicial-articulos)


;; Aplicando una funcion f si es que el elemento cumple un criterio c
; Otra forma de resolverlo es usando map

(define aplicar-descuento-si-cumple-criterio
  (lambda (descuento criterio)
      (lambda (articulo-a-cambiar)
        (cond
          [(criterio articulo-a-cambiar)
           (articulo (get-id articulo-a-cambiar)
                     (get-nombre articulo-a-cambiar)
                     (get-tipo articulo-a-cambiar)
                     (- (get-precio articulo-a-cambiar) descuento))]))))

;; Recuperar todos los articulos de un cierto tipo, por ejemplo: "tecnologia"
(define criterio-articulo-es-del-tipo
  (lambda (tipo)
    (lambda (articulo)
      (cond
        [(eq? tipo (get-tipo articulo) #t)]
        [else #f]))))

;(write "Aplicando una funcion f si es que el elemento cumple un criterio c \n")
;(mi-map (aplicar-descuento-si-cumple-criterio 10 (criterio-articulo-es-del-tipo "tecnologia")) lista-inicial-articulos)
       
;; Calcular la suma total de todos los precios de todos los articulos de esta lista

;; Descripción: La función reducir reduce una lista de valores a un solo valor, aplicando de forma repetida
;;              una función binaria (es decir, 2 argumentos de entrada) a la lista de valores
;; Referencia: Función vista en clase del profesor Gonzalo Martinez
(define mi-reducir
  (lambda (funcion-reduccion lista acum)
    (cond
      [(null? lista) acum]
      [(funcion-reduccion (car lista)
                          (mi-reducir funcion-reduccion (cdr lista) acum))])))

(define operacion-sumar-y-acumular-precios-articulos
  (lambda (articulo acum)
    (+ (get-precio articulo) acum)))

; Sin asociarlo a una función
(mi-reducir operacion-sumar-y-acumular-precios-articulos lista-inicial-articulos 0)

; Asociado a una función
(define obtener-suma-de-todos-los-precios
  (lambda (lista-articulos)
    (mi-reducir operacion-sumar-y-acumular-precios-articulos lista-articulos 0)))

(obtener-suma-de-todos-los-precios lista-inicial-articulos)


;; Ahora que ya sabemos y aplicamos el concepto de reduce (reducir)
;; Podemos obtener: La SUMA DEL PRECIO DE TODOS LOS ARTICULOS
;;                  que tengan DESCUENTO DEBIDO a un CRITERIO 

(define obtener-suma-del-precio-articulos-con-descuento-debido-a-criterio
  (lambda (descuento categoria lista-articulos)
    (mi-reducir operacion-sumar-y-acumular-precios-articulos
                (mi-map (aplicar-descuento-al-articulo descuento)
                        (mi-filtro (articulo-es-del-tipo? categoria) lista-articulos)) 0)))

(obtener-suma-del-precio-articulos-con-descuento-debido-a-criterio 30 "tecnologia" lista-inicial-articulos)

;; Otras funciones

; len: Obtener el largo de una lista
(define len
  (lambda (lista)
    (if (null? lista) 0
        (+ 1 (len (cdr lista))))))

; Ejemplo
(len lista-inicial-articulos)

;; El resultado de las funciones reduce permite obtener totales
;; Estos valores totales a su vez nos permiten calcular estadisticas asociadas

; Funcion estandar de promedios
;(define promedio
;  (lambda (lista)
;  (/ (obtener-suma-total lista) (len lista)))

(define promedio-de-precios
  (lambda (lista-articulos)
    (/ (obtener-suma-de-todos-los-precios lista-articulos) (len lista-articulos))))

; Ejemplo
(promedio-de-precios lista-inicial-articulos)


; my-list-ref: Obtiene el elemento en la i-ésima posición, partiendo desde 0
(define my-list-ref
  (lambda (lista i)
    (if (= i 0)
        (car lista)
        (my-list-ref (cdr lista) (- i 1)))))

; Ejemplo
(my-list-ref lista-inicial-articulos 1)

;;-------------------------------------------------------
;; Resumen


; Constructor del TDA lista de elementos
(define (lista-elementos . elementos) elementos)

; Función para agregar un elemento e una lista L
(define agregar-elemento
  (lambda (L e)
    (if (null? L)
        (cons e null)
        (cons (car L) (agregar (cdr L) e)))))

;; Resumen de funciones clásicas de alto nivel

; my-map: Aplica la función f a todos los elementos de la lista L
(define my-map
  (lambda (f L)
    (if (null? L)
        null
        (cons (f (car L)) (my-map f (cdr L))))))

; my-filter: Aplica una función filtro f a los elementos de una lista L
(define my-filter
  (lambda (f L)
    (if (null? L)
        null
        (if (f (car L))
            (cons (car L) (my-filter f (cdr L)))
            (my-filter f (cdr L))))))

; my-reduce: Reduce una lista de valores L a un solo valor acumulado (acc) aplicando una función de reducción f
(define my-reduce
  (lambda (f L acc)
    (if (null? L)
        acc
        (f (car L) (my-reduce f (cdr L) acc)))))
