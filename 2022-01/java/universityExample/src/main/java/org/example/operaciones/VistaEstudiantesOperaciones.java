package org.example.operaciones;

import org.example.tda.Estudiante;

import java.util.Collections;
import java.util.List;

public class VistaEstudiantesOperaciones {

    public static void mostrarEstudiantesSortByPromedio(List<Estudiante> estudiantes) {
        Collections.sort(estudiantes); // Ordena estudiantes por el método comparator
        System.out.println(estudiantes);
    }
}
