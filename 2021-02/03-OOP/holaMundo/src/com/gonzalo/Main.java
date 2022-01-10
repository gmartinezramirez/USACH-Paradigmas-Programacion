package com.gonzalo;

import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {

        Persona persona1 = new Persona("Gonzalo", "Martinez", 25);
        System.out.println(persona1.getNombre());
        System.out.println(persona1.getEdad());
        System.out.println(persona1.getApellido());

        System.out.println(persona1.toString());

        Critico critico = new Critico("gonzalo");
        Pelicula bladeRunner = new Pelicula("Blade Runner", 1979);

        System.out.println(critico.getNombre());
        System.out.println(critico.getPelicula());

        System.out.println(bladeRunner.getYear());

        critico.setPelicula(bladeRunner);
        System.out.println(critico.getPelicula().getYear());
        System.out.println(critico.getPelicula().getNombre());
        System.out.println(critico.getPelicula().getCalificacion());

        critico.getPelicula().setCalificacion(10);
        System.out.println(critico.getPelicula().getCalificacion());

        Punto2D punto2d = new Punto2D(2,4);
        System.out.println(punto2d.getX());

        Punto3D punto3D = new Punto3D(1,2);
        System.out.println(punto3D.getX());

        Punto2D otroPunto3d = new Punto3D(9,9);
        otroPunto3d.getX();

        Cuadrado miCuadrado = new Cuadrado(4);
        System.out.println(miCuadrado.getNumeroLados());
        System.out.println(miCuadrado.getArea());

        Figura miFigura = new Figura(90);
        System.out.println(miFigura.getArea());

        // Polimorfismo
        // Ejemplo Conceptual
        //Figura miFigura2 = new Paralelepipedo(16);
        //System.out.println(miFigura2.getArea());

        //List<int> miLista = new CircularArray<>();
        //miLista.add(2);

    }
}
