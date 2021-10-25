#lang racket

; Pregunta 1


;a)
;El TDA “comando” lo defino como una lista con el nombre del comando y luego una lista de argumentos. Ej: ‘(“EXTRUIR” (0.4))
;Y el listado de comandos es sólo una lista del TDA descrito anteriormente.

(define comando->getNombre car)
(define comando->getArgs cadr)

;b)
;Esta pregunta se simplifica entendiendo como que se debe realizar primero un filtro de sólo los comandos EXTRUIR,
; luego aplicando la función “reduce” (debe ser implementada) para obtener la cantidad de milímetros de filamento utilizado
; y finalmente aplicando las fórmulas para para obtener el peso de impresión.

(define filtar
  (lambda (L f)
    (if (null? L)
        ‘()
        (if (f (car L))
            (cons (car L) (filtrar (cdr L) ff))
            (filtrar (cdr L) f )
            ))))

(define reducir
  (lambda (L fRedux cont)
    (if (null? L) cont
        (reducir (cdr L) fRedux (fRedux (car L) cont)))))

(define largoImpresion
  (lambda (comandos) 
    (reducir
     (map (compose car comando->getArgs) ; Para obtener primer argumento
          (filtrar comandos (lambda (c) 
                              (equal? (comando->getNombre c) “EXTRUIR”) ))) + 0)))

(define areaTransversal
  (lambda (r) (* PI r r) ) )

(define pesoImpresion
  (lambda (comandos grosor densidad) 
    (* densidad (* (areaTransversal (/ grosor 2) (largoImpresion comandos))))))

;c)
(define (tiempoTotalImpresion comandos)
  (* 0.1 (reducir (map
                   (lambda (c) 1) ; Siempre retorna 1
                   (filtrar comandos (lambda (c) 
                                       (or (equal? (comando->getNombre c) “SUBIR”)
                                           (equal? (comando->getNombre c) “MOVER”)))))
                  + ; Sumo puros 1, para contar los comandos “SUBIR” o “MOVER”
                  0)))

;d)
;La función solicitada es justamente lo mismo que “reducir” que fue definida anteriormente.
(define obtenerEstadistica reducir)

;e)

;Se puede currificar en cualquier orden sus argumentos.

(define obtenerEstadisticaCurry
  (lambda (L)
    (lambda (fRedux)
      (lambda (cont)
        (obtenerEstadistica L fRedux cont)))))

