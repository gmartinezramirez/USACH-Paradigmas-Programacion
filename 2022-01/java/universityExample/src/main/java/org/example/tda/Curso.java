package org.example.tda;

import java.util.ArrayList;
import java.util.List;

public class Curso {

    String nombre;
    int year;
    int semestre;
    List<Estudiante> estudiantes = new ArrayList<>();
    List<Integer> notas = new ArrayList<>();
    Departamento departamento;

    // Referencia: https://www.baeldung.com/java-generating-random-numbers-in-range
    public void agregarCincoNotasRandom() {
        int numberOfElements = 5;

        for (int i = 0; i < numberOfElements; i++) {
            int notaRandom = getRandomNumberBetween(1, 7);
            notas.add(notaRandom);
        }
    }

    public int getRandomNumberBetween(int min, int max) {
        return (int) ((Math.random() * (max - min)) + min);
    }
}
