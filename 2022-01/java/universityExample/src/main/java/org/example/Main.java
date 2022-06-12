package org.example;

import org.example.tda.Departamento;
import org.example.tda.Estudiante;
import org.example.tda.Profesor;
import org.example.tda.Universidad;
import org.example.vista.VistaPrincipal;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        Universidad usach = setUpUniversidad();
        VistaPrincipal sistemaVistaPrincipal = new VistaPrincipal(usach);
        sistemaVistaPrincipal.start();
    }

    private static Universidad setUpUniversidad() {
        List<Estudiante> listaInicialEstudiantes = setUpEstudiantes();
        List<Profesor> listaInicialProfesores = setUpProfesores();


        Universidad usach = new Universidad("USACH");
        usach.setEstudiantes(setUpEstudiantes());

        Departamento diinf = new Departamento(usach, "DIINF"); // Universidad - Departamento: Relacion fuerte
        //usach.addDepartamento(diinf); // Universidad - Departamento: Relacion fuerte

        //diinf.agregarProfesor(new Profesor("profeParadigmas", "9999-9"));
        return usach;
    }

    private static List<Estudiante> setUpEstudiantes() {
        List<Estudiante> listaInicial = new ArrayList<>();
        listaInicial.add(new Estudiante("estudiante1", "111", 4));
        listaInicial.add(new Estudiante("estudiante2", "222", 7));
        listaInicial.add(new Estudiante("estudiante3", "222", 5));
        listaInicial.add(new Estudiante("estudiante4", "222", 1));
        return listaInicial;
    }

    private static List<Profesor> setUpProfesores() {
        return Arrays.asList(
                new Profesor("profe1", "222"),
                new Profesor("profe2", "333"));
    }
}