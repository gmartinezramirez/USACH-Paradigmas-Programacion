package org.example.operaciones;

import org.example.tda.Estudiante;
import org.example.tda.Universidad;

public class VistaPrincipalOperaciones {

    public static void matricularEstudiante(Universidad universidad, String inputNombre, String inputRut) {
        Estudiante estudiante = new Estudiante(inputNombre, inputRut);
        universidad.matricularEstudiante(estudiante);
        System.out.println("Estudiante matriculado con éxito!");
    }

    public static void mostrarEstudiantes(Universidad universidad) {
        universidad.mostrarEstudiantes();
    }

}
