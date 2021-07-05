package com.usach;

import com.usach.TDA.Critico;
import com.usach.TDA.Pelicula;

import java.util.Arrays;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        List<Pelicula> peliculas = Arrays.asList(
                new Pelicula("mi pelicula 1", 0),
                new Pelicula("mi pelicula 2", 0)
        );

        Critico personaCritico = new Critico("mi critico 1", peliculas);

        // El critico esta asociado a N peliculas
        // El critico puede cambiar la nota de cualquier pelicula que tiene asignada
        personaCritico.asignarNotaAPelicula("mi pelicula 1", 7);

        System.out.println(personaCritico.getPeliculasCriticadas());

    }
}
