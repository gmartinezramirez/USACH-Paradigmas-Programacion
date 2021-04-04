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

(define pokemon-squirtle
  (pokemon "squirtle" 8 100))

(define pokemon-pikachu
  (pokemon "pikachu" 5 100))

(define pokemon-charmander
  (pokemon "charmander" 10 100))

(define pokemon-pidgeot
  (pokemon "pidgeot" 3 70))

(define trainer-capture-pokemon
  (lambda (trainer)
    (lambda (pokemon)
      (list (trainer-get-name trainer)
            (cons (trainer-get-pokemons trainer) pokemon)))))

  
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

;; TODO: Ash must return Squirtle pokemon, at the moment is not working
(trainer-get-pokemons trainer-ash)