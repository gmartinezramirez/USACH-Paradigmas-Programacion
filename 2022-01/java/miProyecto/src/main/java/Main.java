import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

public class Main {
    public static void main(String args[]) {
///*        Point3D miPrimerPunto = new Point3D(1,2,3);
//
//        System.out.println(miPrimerPunto.getX());
//        System.out.println(miPrimerPunto.getY());
//        System.out.println(miPrimerPunto.getZ());
//
//        Point3D miSegundoPunto = new Point3D(100,200,300);
//
//        System.out.println(miSegundoPunto.getX());
//        System.out.println(miSegundoPunto.getY());
//        System.out.println(miSegundoPunto.getZ());
//
//        miPrimerPunto.setX(999);
//        System.out.println("Mi primer punto es: ");
//        System.out.println(miPrimerPunto.getX());
//        System.out.println(miPrimerPunto.getY());
//        System.out.println(miPrimerPunto.getZ());
//
//        miPrimerPunto.setZ(111);
//        System.out.print("Mi primer punto es: ");
//        System.out.println(miPrimerPunto.getX());
//        System.out.println(miPrimerPunto.getY());
//        System.out.println(miPrimerPunto.getZ());
//
//        System.out.println(miPrimerPunto.toString());
//
//        Point3D miTercerPunto = new Point3D(6,7,10);
//        System.out.println(miTercerPunto.getX());
//        */
//
//        // Pelicula
//        var director1 = new Persona("unDirector", 70);
//        var director2 = new Persona("unDirector2", 90);
//
//        var miPelicula = new Pelicula(1980, "Volver al Futuro I", director1);
//        var miPelicula2 = new Pelicula(1991, "Toy Story", director2);
//
//        System.out.println("Pelicula 1");
//        System.out.println(miPelicula.getName());
//        System.out.println(miPelicula.getDirector());
//
//        var directorAntiguo = miPelicula.getDirector();
//        miPelicula.setDirector(director2);
//        System.out.println(miPelicula.getDirector());
//
//        System.out.println(directorAntiguo);
//
//        System.out.println(miPelicula2.getDirector());
//
//        // Lista de Peliculas
//
//        var misPeliculas = new ArrayList();
//        misPeliculas.add(miPelicula);
//        misPeliculas.add(miPelicula2);
//
//        for (var pelicula : misPeliculas) {
//            System.out.println(pelicula.toString());
//        }
//
//

        Point2D miPunto2D = new Point2D(2, 3);
        System.out.println(miPunto2D.getX());

        Point3D miPunto3D = new Point3D(1, 2, 3);
        System.out.println(miPunto3D.getX());
        System.out.println(miPunto3D.getY());
        System.out.println(miPunto3D.getZ());
        System.out.println(miPunto3D.toString());

        Point2D pruebita = new Point3D(2, 3, 4);
        System.out.println(pruebita.getX());
        System.out.println(pruebita.getY());
        System.out.println(pruebita.toString());


        Animal miGato = new Gato();
        miGato.avanzar();

        Animal miPerro = new Perro();
        miPerro.avanzar();

        Animal miElefante = new Elefante();
        miElefante.avanzar();

        //Develop against Interfaces

        List<String> ciudades = new ArrayList<>(Arrays.asList("Santiago", "Coquimbo", "Valparaiso"));

        ciudades.add("Otra Ciudad");
        ciudades.add("Otra Ciudad 2");


        // No se puede instanciar interfaces puesto que son abstractas
        //Elefante miElefante = new Animal();

        // Clase concreta
        Perro miMascotaAntigua = new Perro();
        miMascotaAntigua.avanzar(2, 3, 2);
        miMascotaAntigua.avanzar();
        miMascotaAntigua.avanzar();
        miMascotaAntigua.avanzar();

        // Instanciar mediante interfaces
        Animal miMascota = new Perro();
        miMascota.avanzar(2, 3, 2);


    }
}