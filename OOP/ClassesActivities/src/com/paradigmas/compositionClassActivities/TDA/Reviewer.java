package com.paradigmas.compositionClassActivities.TDA;

import java.util.List;

public class Reviewer {

  String name;
  String lastName;
  List<Movie> peliculasCalificadas;

  public Reviewer(String name, String lastName, List<Movie> peliculasCalificadas) {
    this.name = name;
    this.lastName = lastName;
    this.peliculasCalificadas = peliculasCalificadas;
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

  public List<Movie> getPeliculasCalificadas() {
    return peliculasCalificadas;
  }

  public void setPeliculasCalificadas(List<Movie> peliculasCalificadas) {
    this.peliculasCalificadas = peliculasCalificadas;
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
        + ", peliculasCalificadas="
        + peliculasCalificadas
        + '}';
  }
}
