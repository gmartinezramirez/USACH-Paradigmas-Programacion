package com.gonzalo;

public class Pelicula {

    String nombre;
    int year;
    int calificacion;

    public Pelicula(String nombre, int year) {
        this.nombre = nombre;
        this.year = year;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        return "Pelicula{" +
                "nombre='" + nombre + '\'' +
                ", year=" + year +
                ", calificacion=" + calificacion +
                '}';
    }
}
