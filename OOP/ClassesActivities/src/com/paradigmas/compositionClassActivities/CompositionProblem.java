package com.paradigmas.compositionClassActivities;

import com.paradigmas.compositionClassActivities.TDA.Movie;
import com.paradigmas.compositionClassActivities.TDA.Reviewer;

import java.util.List;

public class CompositionProblem {

  public static void executeSolution() {
    Movie pelicula = new Movie("Matrix", "Wachoski", 3, "scifi", "PG", 60);
    Movie pelicula2 = new Movie("Los Venegas salvan al mundo", "bbbb", 7, "scifi", "PG", 120);

    System.out.println(pelicula.getNote());
    System.out.println(pelicula.toString());
    System.out.println(pelicula2.toString());

    pelicula.setNote(7);
    System.out.println(pelicula.getNote());

    System.out.println(pelicula.toString());

    List<Movie> peliculasCalificadas = List.of(pelicula, pelicula2);

    Reviewer criticoDeCine = new Reviewer("Carla", "Lutjens", peliculasCalificadas);
    System.out.println(criticoDeCine.getPeliculasCalificadas());

    for (Movie movie : criticoDeCine.getPeliculasCalificadas()) {
      System.out.println(movie.getName());
      System.out.println(movie.getNote());
    }

    System.out.println(criticoDeCine.toString());

    for (Movie movie : criticoDeCine.getPeliculasCalificadas()) {
      movie.setNote(1);
    }

    for (Movie movie : criticoDeCine.getPeliculasCalificadas()) {
      System.out.println(movie.getName());
      System.out.println(movie.getNote());
    }

    System.out.println(criticoDeCine.toString());
  }
}
