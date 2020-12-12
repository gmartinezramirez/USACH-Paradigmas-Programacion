package com.paradigmas.TDA;

import java.util.ArrayList;
import java.util.List;

public class Student {
  private final String name;

  private final List<Professor> professors = new ArrayList<>();

  public Student(String name) {
    this.name = name;
  }

  public String getName() {
    return this.name;
  }

  public void addTeacher(Professor aProfessor) {
    this.professors.add(aProfessor);
  }

  public void print() {
    System.out.println("Student: " + this.name + " Professors associated: ");
    for (Professor professor : this.professors) {
      System.out.println("- " + professor.getName());
    }
  }
}
