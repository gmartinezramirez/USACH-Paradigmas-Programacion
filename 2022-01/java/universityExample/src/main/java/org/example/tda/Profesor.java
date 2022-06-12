package org.example.tda;

import java.util.ArrayList;
import java.util.List;

public class Profesor {

    String nombre;
    String rut;
    List<Curso> cursosAsociados = new ArrayList<>();

    public Profesor(String nombre, String rut) {
        this.nombre = nombre;
        this.rut = rut;
    }

}
