package org.example.tda;

import java.util.ArrayList;
import java.util.List;

public class Estudiante implements Comparable<Estudiante> {

    Universidad universidad;
    String nombre;
    String rut;
    List<Curso> cursosInscritos = new ArrayList<>();
    List<Curso> cursosDesincritos = new ArrayList<>();

    int promedio;

    public Estudiante(String nombre, String rut) {
        this.nombre = nombre;
        this.rut = rut;
        // Por defecto los estudiantes creados tendran promedio 0
        this.promedio = 0;
    }

    public Estudiante(String nombre, String rut, int promedio) {
        this.nombre = nombre;
        this.rut = rut;
        this.promedio = promedio;
    }


    public void inscribirCurso(Curso curso) {
        // No es responsabilidad de la clase Estudiante crear un curso
        // El curso ya fue creado y esta clase simplemente lo agrega
        // Concepto: Cohesion - Acoplamiento
        // Cohesion: La clase Estudiante solo realiza operaciones relativas a la lógica de Estudiante, nada más
        // Acoplamiento: La clase Estudiante esta desacoplada de la clase Curso. Por lo que cada uno de ellos es independiente
        cursosInscritos.add(curso);
    }

    public void desincribirCurso(Curso curso) {
        cursosInscritos.remove(curso);
        cursosDesincritos.add(curso);
    }

    // Referencia: https://www.geeksforgeeks.org/how-to-override-compareto-method-in-java/
    // Overriding (sobreescribiendo) metodo compareTo()
    @Override
    public int compareTo(Estudiante o) {
        // if current object is greater,then return 1
        // if current object is greater,then return -1
        // if current object is equal to o,then return 0
        return Integer.compare(this.promedio, o.promedio);

        //otra forma
        /*
        if (this.promedio > o.promedio) {
            // if current object is greater,then return 1
            return 1;
        } else if (this.promedio < o.promedio) {
            // if current object is greater,then return -1
            return -1;
        } else {
            // if current object is equal to o,then return 0
            return 0;
        }
         */
    }

    @Override
    public String toString() {
        return "Estudiante{" +
                "nombre='" + nombre + '\'' +
                ", rut='" + rut + '\'' +
                ", cursosInscritos=" + cursosInscritos +
                ", cursosDesincritos=" + cursosDesincritos +
                ", promedio=" + promedio +
                '}';
    }
}
