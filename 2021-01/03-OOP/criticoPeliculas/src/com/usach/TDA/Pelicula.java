package com.usach.TDA;

public class Pelicula {

    String nombre;
    int nota;

    public Pelicula(String nombre, int nota) {
        this.nombre = nombre;
        this.nota = nota;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    @Override
    public String toString() {
        return "Pelicula{" +
                "nombre='" + nombre + '\'' +
                ", nota=" + nota +
                '}';
    }
}
