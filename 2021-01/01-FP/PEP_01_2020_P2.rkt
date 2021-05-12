#lang racket

;selectores X dom: pixel  rec: entero  ej: (X pixel) (Y pixel) (R pixel) (G pixel) (B pixel)
(define X (lambda (pixel) (car pixel)))
(define Y (lambda (pixel) (car (cdr pixel))))
(define R (lambda (pixel) (car (cdr (cdr pixel)))))
(define G (lambda (pixel) (car (cdr (cdr (cdr pixel))))))
(define B (lambda (pixel) (car (cdr (cdr (cdr (cdr pixel)))))))

;función de filtrado dom: función booleana X lista  rec: lista (filter number? (list 1 2))
;recursión: natural
(define filter (lambda (f L)
                 (if (null? L) 
                     null 
                     (if (f (car L)) 
                         (cons (car L) (filter f (cdr L)))
                         (filter f (cdr L))))))
    
;función map dom: función X lista  rec: lista (map sqrt (list 1 2)) ;recursión: natural
(define map (lambda (f L) (if (null? L) null (cons (f (car L)) (map f (cdr L))))))

;función largo lista dom: lista  rec: entero (length (list 1 2)) ;recursión: natural
(define length (lambda (L) (if (null? L) 0 (+ 1 (length (cdr L))))))

;; Pregunta 1
;; Función que comprime una imagen eliminando todos los pixeles blancos (i.e., cuando R=255 y G=255 y B=255) de la imagen.
;; El resultado es una imagen comprimida cuya representación es distinta a la de una imagen sin comprimir ya que mantiene
;; un registro de la dimensión original de la imagen en la primera posición de la lista.
;; El prototipo para la función debe ser:     (comprimir imagen)

;; Constructor
(define pixel
  (lambda (X Y R G B)
    (list X Y R G B)))

(define pixelA
  (list 10 10 10 10 10))

(define pixelB
  (list 255 255 255 10 10))

(define imagen
  (list pixelA pixelB))

; determina si pixel no es blanco  dom: pixel   rec: boolean  ej: (notWhite ‘(1 2 32 32 32))
(define pixel-no-es-blanco?
  (lambda (pixel) 
    (not (and (= (R pixel) 255)
              (= (G pixel) 255)
              (= (B pixel) 255)))))

; Ejemplo
(pixel-no-es-blanco? (pixel 10 10 10 10 10)) 

; comprime imagen dom: imagen  rec: imagen comprimida   ej: (comprimir (pix1 .... pixN))
(define comprimir
  (lambda (imagen) 
    (cons (length imagen) (filter pixel-no-es-blanco? imagen))))

(comprimir imagen)

;; Pregunta 2
;Función que convierte una imagen a color a una blanco y negro.
; Para esto, en cada pixel, reemplaza los valores R,G,B por el resultado de la siguiente operación:
; redondear ((R + G + B) / 3.0) / 255) * 255
;El prototipo para la función debe ser: (color->BW imagen)

; Función que ajusta color pixel a BW dom: pixel rec: pixel (pixel->BW sqrt ‘(1 2 32 32 32))
(define pixel->BW
  (lambda (pixel) 
    (list (X pixel) (Y pixel) 
          (round (* (/ (/ (+ (R pixel) (G pixel) (B pixel)) 3) 255) 255))
          (round (* (/ (/ (+ (R pixel) (G pixel) (B pixel)) 3) 255) 255))
          (round (* (/ (/ (+ (R pixel) (G pixel) (B pixel)) 3) 255) 255)))))

(pixel->BW pixelA)

; Convierte imagen color a BW dom: imagen rec: imagen (color->BW (pix1 .... pixN) )
(define color->BW
  (lambda (imagen) 
    (map pixel->BW imagen)))

(color->BW imagen)

;; Pregunta 3
;;  Función que permite eliminar aquellos colores que superan un umbral (R, G, B).

;; a.  El prototipo para la función debe ser:     (ajustarColor f imagen)
;; Convierte imagen color a BW dom: imagen rec: imagen (color->BW (pix1 .... pixN) )
(define ajustarColor
  (lambda (f imagen)
    (map f imagen)))

;; b. Implementar funciones currificada para ajustar cada canal (i.e., R, G y B).
;; Estas funciones se usarán como parámetro “f” en la función ajustarColor.

(define setR
  (lambda (ponderador)
    (lambda (pixel)
      (list (X pixel) 
            (Y pixel) 
            (round (* ponderador (R pixel)) (G pixel) (B pixel))))))

(define setG
  (lambda (ponderador)
    (lambda (pixel)
      (list (X pixel) 
            (Y pixel) 
            (R pixel) (round (* ponderador (G pixel)) (B pixel))))))

(define setB
  (lambda (ponderador)
    (lambda (pixel)
      (list (X pixel) 
            (Y pixel) 
            (R pixel) (G pixel) (round (* ponderador (B pixel)))))))

;; c. Muestre cómo se usaría la función ajustarColor para cambiar el color azul (Blue) de una imagen I1 (preexistente)  al 30% (ponderador = 0.3).
(ajustarColor (setB 0.3) imagen)
