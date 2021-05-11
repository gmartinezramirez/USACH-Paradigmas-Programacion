#lang racket

;; PEP 1 01 2020

;; PREGUNTA 1
;; El laboratorio médico VeriHealth S.A. se encarga de recolectar y evaluar exámenes de laboratorio de pacientes de varios hospitales y clínicas de la ciudad, con el fin de determinar las posibles patologías que puedan tener (ej: diabetes, hipotiroidismo, anemia, etc.). Con el advenimiento de las enfermedades de invierno, se hace necesario implementar en VeriHealth S.A. un nuevo sistema para el etiquetado de muestras. Se le ha encargado a usted desarrollar un prototipo del sistema en pseudo-Scheme bajo el paradigma de programación funcional.
;; Toda muestra posee
;; - un RUT del paciente (string)
;; - ID de muestra (entero)
;;edad (entero),
;;su sexo biológico (string, “M” o “F”),
;;centro hospitalario de origen (string),
;;si la muestra ya ha sido evaluada (booleano),
;;si el paciente consume medicamentos (booleano),
;;sus enfermedades preexistentes (string)
;;las enfermedades detectadas por la misma muestra (string).


; Constructor y Pertenencia TDA Muestra y Lista de Muestras

;; 1.1 Diseñe una representación para los TDAs Lista de Muestras y Muestra, añadiendo un ejemplo de uso.
;; Luego implemente sus constructores y funciones de pertenencia.

;; Constructores

;; Constructor muestra

(display "TDA muestra \n")

;; Descripción:
;; Dom:
;; Rec:
;; Ejemplo de uso:
(define muestra
  (lambda (rut id edad sexo hospital evaluada? consume-medicamentos? enf-pre enf-detect)
    (list rut id edad sexo hospital evaluada? consume-medicamentos? enf-pre enf-detect)))

(define muestra-gonzalo
  (muestra "18045598-1" 0 28 "M" "Sotero del rio" #t #t "enf pre1" "enf detect1"))

(define muestra-persona1
  (muestra "19045598-1" 0 29 "M" "Sotero del rio" #t #f "enf pre2" "enf detect2"))

muestra-gonzalo
muestra-persona1

;; Protip: NO SE PREOCUPEN DE VALIDACIONES

;; Constructor lista de muestras
(display "TDA Lista de muestras \n")

(define (lista-muestras . muestras) muestras)
(lista-muestras muestra-gonzalo)
(lista-muestras muestra-gonzalo muestra-persona1)

;; Pertenencia

(define (get-rut muestra) (car muestra))
(define (get-id muestra) (cadr muestra))
(define (get-edad muestra) (caddr muestra))
(define (get-sexo muestra) (cadddr muestra))

(define (get-hospital muestra) (cadddr (cdr muestra)))
(define (get-evaluada muestra) (cadddr (cdr (cdr muestra))))
(define (get-medicamentos muestra) (cadddr (cdr (cdr (cdr muestra)))))
(define (get-enf-pre muestra) (cadddr (cdr (cdr (cdr (cdr muestra))))))
(define (get-enf-detect muestra) (cadddr (cdr (cdr (cdr (cdr (cdr muestra)))))))

;; Para efectos de la PEP, pueden escribir los selectores de esta forma
;(define (get-hospital muestra) (caddddr muestra))
;(define (get-evaluada muestra) (cadddddr muestra))
;(define (get-medicamentos muestra) (caddddddr muestra))
;(define (get-enf-pre muestra) (cadddddddr muestra))
;(define (get-enf-detect muestra) (caddddddddr muestra))

;(get-rut muestra-gonzalo)

;; 1.2
;; Implemente una función para el TDA Lista de Muestras que dado un RUT de un paciente y su ID de muestra,
;; permita cambiar el estado de evaluación de la muestra y además cambiar las enfermedades que fueron detectadas en dicha muestra

;; Verificar si el paciente y ID de muestra son los mismos que los ingresados

(define mismo-paciente-id-rut?
  (lambda (rut id lista-muestras)
    (cond
      [(and (eq? (get-rut (car lista-muestras)) rut)
            (eq? (get-id (car lista-muestras)) id))
       #t]
      [else #f])))

;; Cambiar el estado de evaluacion de muestra y enfermedades detectadas
(define set-muestra-evaluada-enf-detect
  (lambda (lista-muestras rut id evaluada? enf-detect)
    (muestra rut id
             (get-edad (car lista-muestras))
             (get-sexo (car lista-muestras))
             (get-hospital (car lista-muestras))
             evaluada?
             (get-medicamentos (car lista-muestras))
             enf-detect)))

;; Modificar la muestra

(define modificar-muestra
  (lambda (lista-muestras rut id evaluada? enf-detect)
    (cond
      [(null? lista-muestras) lista-muestras]
      [(mismo-paciente-id-rut? rut id lista-muestras)
       (cons (set-muestra-evaluada-enf-detect lista-muestras rut id evaluada? enf-detect)
             (cdr lista-muestras))]
      [else modificar-muestra (cdr lista-muestras) rut id evaluada? enf-detect])))


; Pregunta 3
; A partir de sus implementaciones en las preguntas 1 y 2, se solicita implementar las siguientes funciones que permitan lo siguiente:
;Recuperar todas las muestras de un paciente determinado (por RUT). (3 ptos)
;Recuperar todas las muestras de pacientes dentro de un rango etáreo (especificando edad mínima y máxima). (3 ptos)
;Recuperar todas las muestras cuya enfermedad detectada es la indicada como parámetro de entrada. Esta función también debe aceptar coincidencias parciales (Ej: “abe” debiese retornar “Diabetes”). (4 ptos)
;Recuperar todas las muestras de acuerdo a un criterio personalizado en una función f, la cual debe ser indicada en el momento de ejecutar la función. (5 ptos)
;Hacer una función currificada que permita obtener las muestras bajo los criterios indicados en los ítems (b) y (c) de manera simultánea. (5 ptos)


;; Datos de prueba
(define muestra1-gonzalo
  (muestra "18045598-1" 0 28 "M" "Sotero del rio" #t #t "catarro" "gripe"))

(define muestra2-gonzalo
  (muestra "18045598-1" 0 28 "M" "Sotero del rio" #f #t "gripe" "toz"))

(define muestra1-otra-persona
  (muestra "20111528-k" 0 29 "M" "Sotero del rio" #t #t "toz" "nauseas"))

(define listado-de-ejemplo-rut
  (lista-muestras muestra1-gonzalo muestra2-gonzalo muestra1-otra-persona))

;; Recuperar todas las muestras de un paciente determinado (por RUT)
(define (filtro-rut lista-muestras rut)
  (cond
    [(null? lista-muestras) null]
    [(eq? (get-rut (car lista-muestras)) rut)
     (cons (car lista-muestras) (filtro-rut (cdr lista-muestras) rut))]
    [else filtro-rut (cdr lista-muestras) rut]))

(filtro-rut listado-de-ejemplo-rut "18045598-1")

;; Recuperar todas las muestras de pacientes dentro de un rango etáreo (especificando edad mínima y máxima)

;; Referencia: Función vista en clase del profesor Gonzalo Martinez
(define (mi-filtro pred lista)
  (cond
    [(null? lista) '()]
    [(pred (car lista))
     (cons (car lista) (mi-filtro pred (cdr lista)))]
    [else (mi-filtro pred (cdr lista))]))

(display "Filtro de rut \n")

;; Función currificada
;; Recuperar todas las muestras de un paciente determinado (por RUT)
(define es-mismo-rut?
  (lambda (rut)
    (lambda (muestras)
      (cond
        [(eq? rut (get-rut muestras)) #t]
        [else #f]))))

(display "- Ejemplos filtro de rut \n")
(mi-filtro (es-mismo-rut? "18045598-1") listado-de-ejemplo-rut)

;; Función currificada
;; Recuperar todas las muestras de pacientes dentro de un rango etáreo (especificando edad mínima y máxima)
(define edad-entre-min-y-max?
  (lambda (min max)
    (lambda (muestras)
      (cond
        [(and (<= min (get-edad muestras))
              (>= max (get-edad muestras)))
         #t]
        [else #f]))))

(display "- Ejemplos filtro de edad min y max \n")
(mi-filtro (edad-entre-min-y-max? 28 30) listado-de-ejemplo-rut)

;; Función currificada
;; Recuperar todas las muestras cuya enfermedad detectada es la indicada como parámetro de entrada. Esta función también debe aceptar coincidencias parciales
(define es-misma-enf-detectada?
  (lambda (enf-detectada)
    (lambda (muestras)
      (cond
        [(eq? enf-detectada (get-enf-detect muestras))
         #t]
        [else #f]))))

(display "- Ejemplos filtro de enf detectada \n")
(mi-filtro (es-misma-enf-detectada? "gripe") listado-de-ejemplo-rut)

;; Función currificada
; Recuperar todas las muestras de acuerdo a un criterio personalizado en una función f, la cual debe ser indicada en el momento de ejecutar la función.
; Criterio, recuperar todas las muestras de personas cuyo sexo biologico son "M"

(define criterio-sexo
  (lambda (sexo)
    (lambda (muestras)
      (cond
        [(eq? sexo (get-sexo muestras))
         #t]
        [else #f]))))

(display "- Ejemplos criterio personalizado, en este caso sexo M \n")
(mi-filtro (criterio-sexo "M") listado-de-ejemplo-rut)
(display "- Ejemplos criterio personalizado, en este caso sexo F \n")
(mi-filtro (criterio-sexo "F") listado-de-ejemplo-rut)

;; Filtrar por Rango Etáreo y Enfermedad (currifcada)
(define edad-rango-misma-enf-detectada?
  (lambda (min max)
    (lambda (enf-detectada)
      (lambda (muestras)
        (cond
          [(and (<= min (get-edad muestras))
                (>= max (get-edad muestras))
                (eq? enf-detectada (get-enf-detect muestras)))
           #t]
          [else #f])))))

(display "- Ejemplos filtro por rango etareo y enfermedad \n")
(mi-filtro ((edad-rango-misma-enf-detectada? 28 30) "gripe") listado-de-ejemplo-rut)

;; Filtro custom
(define (filtro-custom lista-muestras funcion)
  (cond
    [(null? lista-muestras) null]
    [(funcion (car lista-muestras))
     (cons (car lista-muestras) (filtro-custom (cdr lista-muestras) funcion))]
    [else filtro-custom (cdr lista-muestras) funcion]))

