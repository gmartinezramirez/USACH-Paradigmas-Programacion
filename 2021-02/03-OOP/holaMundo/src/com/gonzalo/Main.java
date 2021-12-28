package com.gonzalo;

public class Main {

    public static void main(String[] args) {

        /*Persona persona1 = new Persona("Gonzalo", "Martinez", 25);
        System.out.println(persona1.getNombre());
        System.out.println(persona1.getEdad());
        System.out.println(persona1.getApellido());

        System.out.println(persona1.toString());*/

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

    }
}
