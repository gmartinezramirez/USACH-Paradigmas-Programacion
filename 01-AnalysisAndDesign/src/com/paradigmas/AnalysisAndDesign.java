package com.paradigmas;

import com.paradigmas.TDA.Movie;
import com.paradigmas.TDA.Reviewer;

import java.util.List;

public class AnalysisAndDesign {

  public static void main(String[] args) {
    Movie movie1 = new Movie("Matrix", "Wachoski", 3, "scifi", "PG", 60);
    Movie movie2 = new Movie("Los Venegas salvan al mundo", "bbbb", 7, "scifi", "PG", 120);

    System.out.println(movie1.getNote());
    System.out.println(movie1.toString());
    System.out.println(movie2.toString());

    movie1.setNote(7);
    System.out.println(movie1.getNote());
    System.out.println(movie1.toString());

    List<Movie> movies = List.of(movie1, movie2);

    Reviewer movieReviewer = new Reviewer("Carla", "Lutjens", movies);
    System.out.println(movieReviewer.getQualifiedMovies());

    for (Movie movie : movieReviewer.getQualifiedMovies()) {
      System.out.println(movie.getName());
      System.out.println(movie.getNote());
    }

    System.out.println(movieReviewer.toString());

    for (Movie movie : movieReviewer.getQualifiedMovies()) {
      movie.setNote(1);
    }

    for (Movie movie : movieReviewer.getQualifiedMovies()) {
      System.out.println(movie.getName());
      System.out.println(movie.getNote());
    }

    System.out.println(movieReviewer.toString());
  }
}
