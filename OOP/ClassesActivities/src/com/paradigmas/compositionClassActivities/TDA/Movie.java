package com.paradigmas.compositionClassActivities.TDA;

public class Movie {

  String name;
  String directorName;
  int note;
  String category;
  String classification;
  int durationInMin;

  public Movie(
      String name,
      String directorName,
      int note,
      String category,
      String classification,
      int durationInMin) {
    this.name = name;
    this.directorName = directorName;
    this.note = note;
    this.category = category;
    this.classification = classification;
    this.durationInMin = durationInMin;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDirectorName() {
    return directorName;
  }

  public void setDirectorName(String directorName) {
    this.directorName = directorName;
  }

  public int getNote() {
    return note;
  }

  public void setNote(int note) {
    this.note = note;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }

  public String getClassification() {
    return classification;
  }

  public void setClassification(String classification) {
    this.classification = classification;
  }

  public int getDurationInMin() {
    return durationInMin;
  }

  public void setDurationInMin(int durationInMin) {
    this.durationInMin = durationInMin;
  }

  @Override
  public String toString() {
    return "Movie{"
        + "name='"
        + name
        + '\''
        + ", directorName='"
        + directorName
        + '\''
        + ", note="
        + note
        + ", category='"
        + category
        + '\''
        + ", classification='"
        + classification
        + '\''
        + ", durationInMin="
        + durationInMin
        + '}';
  }
}
