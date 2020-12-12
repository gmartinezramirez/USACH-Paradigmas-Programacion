package com.paradigmas.TDA;

import java.util.List;

public class Reviewer {

  String name;
  String lastName;
  List<Movie> qualifiedMovies; //Peliculas calificadas

  public Reviewer(String name, String lastName, List<Movie> qualifiedMovies) {
    this.name = name;
    this.lastName = lastName;
    this.qualifiedMovies = qualifiedMovies;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public List<Movie> getQualifiedMovies() {
    return qualifiedMovies;
  }

  public void setQualifiedMovies(List<Movie> anQualifiedMovies) {
    this.qualifiedMovies = anQualifiedMovies;
  }

  @Override
  public String toString() {
    return "Reviewer{"
        + "name='"
        + name
        + '\''
        + ", lastName='"
        + lastName
        + '\''
        + ", qualifiedMovies="
        + qualifiedMovies
        + '}';
  }
}
