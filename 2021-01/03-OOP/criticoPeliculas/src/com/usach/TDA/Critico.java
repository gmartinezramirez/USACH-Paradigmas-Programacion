package com.usach.TDA;

import java.util.List;

public class Critico {

    String nombre;
    List<Pelicula> peliculasCriticadas;

    public Critico(String nombre, List<Pelicula> peliculasCriticadas) {
        this.nombre = nombre;
        this.peliculasCriticadas = peliculasCriticadas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Pelicula> getPeliculasCriticadas() {
        return peliculasCriticadas;
    }

    public void setPeliculasCriticadas(List<Pelicula> peliculasCriticadas) {
        this.peliculasCriticadas = peliculasCriticadas;
    }

    /**
     * asignarNotaAPelicula
     * Método que busca el nombre de una pelicula y le asigna una nota
     * @param nombrePelicula String
     * @param nota int
     */

    public void asignarNotaAPelicula(String nombrePelicula, int nota) {
        for (Pelicula pelicula : peliculasCriticadas) {
            if (pelicula.getNombre().equals(nombrePelicula)) {
                pelicula.setNota(nota);
            }
        }
    }

    @Override
    public String toString() {
        return "Critico{" +
                "nombre='" + nombre + '\'' +
                ", peliculasCriticadas=" + peliculasCriticadas +
                '}';
    }
}
