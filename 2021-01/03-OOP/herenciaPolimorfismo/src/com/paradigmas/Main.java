package com.paradigmas;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class Main {

    public static void main(String[] args) {

        // Inferencia de tipo
        var miSuperTerrorista = new Terrorista("osama", 0, "superOsama");

        //
        var numero = 3;
        var miString = "hola que hace";

        var miTerrorista = new Terrorista("osama", 0, "superOsama");
	    var jugador = new Player("gonzalo", 100);

	    miTerrorista.holaMundo();
        System.out.println(miTerrorista.getNombreLider());

        Linea2D laMejorLinea2D = new Linea2D(1,2);
        Linea3D laMejorLinea3D = new Linea3D(1,2,3);

        System.out.println(laMejorLinea3D.getZ());

        Cuadrado miCuadrado = new Cuadrado("verde",2, 3);
        Triangulo miTriangulo  = new Triangulo("amarillo",20, 15);

        Redsocial gonzaloNet = new GonzaloNet();
        Redsocial paradigmasNet = new ParadigmasNet();

        gonzaloNet.Registro();
        paradigmasNet.Registro();

        // Lista
        List miLista = new LinkedList();
        List miLista2 = new LinkedList();

        miLista.add(1);
        miLista.add(2);
        miLista.add(3);

        miLista.isEmpty();
        miLista2.isEmpty();

        List<Integer> miSuperLista = new ArrayList<>();
        miSuperLista.add(4);
        miSuperLista.add(2);

        List<Triangulo> miListaDeTriangulos = new ArrayList<>();
        miListaDeTriangulos.add(miTriangulo);

        List<Redsocial> miRedesSociales = new ArrayList<>();
        miRedesSociales.add(gonzaloNet);

        List miListaConDiferentesTipos = new ArrayList();
        miListaConDiferentesTipos.add("holi");
        miListaConDiferentesTipos.add(20);

    }
}
