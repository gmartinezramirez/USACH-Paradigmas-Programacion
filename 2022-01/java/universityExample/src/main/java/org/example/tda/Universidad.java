package org.example.tda;

import java.util.ArrayList;
import java.util.List;

public class Universidad {

    String nombre;

    List<Estudiante> estudiantes = new ArrayList<>();

    // Concepto: Sobrecarga de operadores
    // Constructor Overloading (Sobrecarga del constructor)
    public Universidad(String nombre) {
        this.nombre = nombre;
    }

    public void matricularEstudiante(Estudiante estudiante) {
        System.out.println(estudiante.toString());
        estudiantes.add(estudiante);
    }

    public void mostrarEstudiantes() {
        // Imprime la representación en string de estudiante
        for (Estudiante estudiante : estudiantes) {
            System.out.println(estudiante.toString());
        }
    }

    public List<Estudiante> getEstudiantes() {
        return estudiantes;
    }

    public void setEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }
}
