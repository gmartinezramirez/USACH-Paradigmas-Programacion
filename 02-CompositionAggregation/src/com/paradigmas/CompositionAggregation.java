package com.paradigmas;

import com.paradigmas.TDA.Professor;
import com.paradigmas.TDA.Student;

public class CompositionAggregation {

  public static void main(String[] args) {
    // En la Universidad Acme, los profesores dictan clases y los alumnos se inscriben (asocian) a
    // cada ramo impartido por el profesor.
    // Luego, múltiples estudiantes pueden estar asociados a un solo profesor y un solo estudiante
    // puede estar asociado a múltiples profesores (asociación).
    Professor professor1 = new Professor("gonzalo");
    Professor professor2 = new Professor("roberto");

    Student student1 = new Student("anna");
    Student student2 = new Student("juanito");
    Student student3 = new Student("tulio");
    Student student4 = new Student("pepe");

    professor1.addStudent(student1);
    professor1.addStudent(student2);
    professor1.addStudent(student3);

    professor2.addStudent(student2);
    professor2.addStudent(student3);
    professor2.addStudent(student4);

    professor1.print();
    professor2.print();

    student1.print();
    student2.print();
    student3.print();
    student4.print();
  }
}
