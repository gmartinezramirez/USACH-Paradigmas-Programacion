#lang racket

(define trainer
  (lambda (name pokemons)
    (list name pokemons)))

(define trainer-get-pokemons
  (lambda (trainer)
    (cdr trainer)))

(define trainer-get-name
  (lambda (trainer)
    (car trainer)))

(define pokemon
  (lambda (name level hp)
    (list name level hp)))

(define pokemon-get-name
  (lambda (pokemon)
    (car pokemon)))

(define pokemon-get-level
  (lambda (pokemon)
    (car (cdr pokemon))))

(define pokemon-get-hp
  (lambda (pokemon)
    (car (cdr (cdr pokemon)))))

(define pokemon-level-up
  (lambda (pokemon)
    (list (pokemon-get-name pokemon)
          ( + (pokemon-get-level pokemon) 1)
          (pokemon-get-hp pokemon))))
                            
(define pokemon-eeve
  (pokemon "eevee" 9 50))

(define pokemon-squirtle
  (pokemon "squirtle" 8 100))

(define pokemon-pikachu
  (pokemon "pikachu" 5 100))

(define pokemon-charmander
  (pokemon "charmander" 10 100))

(define pokemon-pidgeot
  (pokemon "pidgeot" 3 70))


;(define (my-append lst item)
;  (if (null? lst)
;    (list item)
;    (cons (car lst) (my-append (cdr lst) item))))

;(define (my-append lst item)
;  (cond [(null? lst) (list item)]
;        [(cons (car lst)
;               (my-append (cdr lst) item))]))

(define (append-pokemon-to-pokemons pokemons pokemon)
  (cond
    [(null? pokemons) (list pokemon)]
    [(cons (car pokemons)
           (append-pokemon-to-pokemons (cdr pokemons) pokemon))]))

(define trainer-capture-pokemon
  (lambda (trainer)
    (lambda (pokemon)
      (append-pokemon-to-pokemons (trainer-get-pokemons trainer) pokemon))))

(define initial-pokemons-ash
  (list pokemon-pikachu pokemon-charmander pokemon-pidgeot))

(define initial-pokemons-gary
  (list pokemon-squirtle))


(define trainer-ash
  (trainer "ash" initial-pokemons-ash))

(define trainer-gary
  (trainer "gary" initial-pokemons-gary))

(trainer-get-pokemons trainer-ash)
(trainer-get-pokemons trainer-gary)

((trainer-capture-pokemon trainer-ash) pokemon-squirtle)
((trainer-capture-pokemon trainer-ash) pokemon-eeve)

(pokemon-level-up pokemon-pikachu)

(define member?
  (lambda (item lst)
    (cond
      [(null? lst) #f]
      [(equal? item (car lst)) #t]
      [else (member? item (cdr lst))])))

(member? "mewtwo" pokemon-pikachu)
(member? "pikachu" pokemon-pikachu)