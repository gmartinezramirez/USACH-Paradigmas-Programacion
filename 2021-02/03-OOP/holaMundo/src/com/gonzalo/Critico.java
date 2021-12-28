package com.gonzalo;

public class Critico {

    String nombre;
    Pelicula pelicula;

    public Critico(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pelicula getPelicula() {
        return pelicula;
    }

    public void setPelicula(Pelicula pelicula) {
        this.pelicula = pelicula;
    }

    @Override
    public String toString() {
        return "Critico{" +
                "nombre='" + nombre + '\'' +
                ", pelicula=" + pelicula +
                '}';
    }
}
