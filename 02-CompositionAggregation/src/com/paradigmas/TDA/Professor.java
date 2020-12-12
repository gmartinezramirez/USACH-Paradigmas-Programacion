package com.paradigmas.TDA;

import java.util.ArrayList;
import java.util.List;

public class Professor {

  private final String name;

  private final List<Student> students = new ArrayList<>();

  public Professor(String name) {
    this.name = name;
  }

  public String getName() {
    return this.name;
  }

  public void addStudent(Student aStudent) {
    aStudent.addTeacher(this);
    this.students.add(aStudent);
  }

  public List<Student> getStudents() {
    return students;
  }

  public void print() {
    System.out.println("Professor: " + this.name + " Students associated:");
    for (Student student : this.students) {
      System.out.println("- " + student.getName());
    }
  }
}
