#lang racket

(define trainer
  (lambda (name pokemons)
    (list name pokemons)))

(define pokemon
  (lambda (name level hp)
    (list name level hp)))

(define pokemon-squirtle
  (pokemon "pikachu" 8 100))

(define pokemon-pikachu
  (pokemon "pikachu" 5 100))

(define pokemon-charmander
  (pokemon "charmander" 10 100))

(define pokemon-pidgeot
  (pokemon "pidgeot" 3 70))

(define initial-pokemons-ash
  (list pokemon-pikachu pokemon-charmander pokemon-pidgeot))

(define initial-pokemons-gary
  (list pokemon-squirtle))

(define trainer-ash
  (trainer "ash" initial-pokemons-ash))

(define trainer-gary
  (trainer "gary" initial-pokemons-gary))