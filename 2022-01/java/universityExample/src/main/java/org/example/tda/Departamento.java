package org.example.tda;

import java.util.ArrayList;
import java.util.List;

public class Departamento {

    Universidad universidad;
    String nombre;
    List<Profesor> profesores = new ArrayList<>();
    Profesor director;

    public Departamento(Universidad universidad, String nombre) {
        this.universidad = universidad;
        this.nombre = nombre;
    }

}
