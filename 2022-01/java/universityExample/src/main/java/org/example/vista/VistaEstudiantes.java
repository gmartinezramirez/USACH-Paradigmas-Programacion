package org.example.vista;

import org.example.menu.Text;
import org.example.operaciones.VistaEstudiantesOperaciones;
import org.example.tda.Estudiante;
import org.example.tda.menu.Menu;

import java.util.List;
import java.util.Scanner;

import static org.example.menu.MenuEstudiantesOptionConstants.*;


public class VistaEstudiantes {

    // Estudiante es el objeto que va ir cambiando
    // Funciona como el contenedor de Estudiantes
    List<Estudiante> estudiantes;

    public VistaEstudiantes(List<Estudiante> estudiantes) {
        this.estudiantes = estudiantes;
    }

    public void show() {
        var estudianteMenu = new Menu(Text.ESTUDIANTES_MENU_DIALOG);

        while (estudianteMenu.getSelectedOption() != ESTUDIANTES_MENU_EXIT_OPTION) {

            estudianteMenu.printContextualDialog();
            var keyboardIn = new Scanner(System.in);
            estudianteMenu.setSelectedOption(keyboardIn.nextInt());

            switch (estudianteMenu.getSelectedOption()) {
                case ESTUDIANTES_MENU_SHOW_SORTED:
                    opcionMostrarEstudiantesOrdenados(estudiantes);
                    estudianteMenu.setSelectedOption(ESTUDIANTES_MENU_DEFAULT_OPTION);
                    break;
                case ESTUDIANTES_MENU_EXIT_OPTION:
                    break;
                default:
                    System.out.println("Ingrese opcion correcta");
            }
        }
    }

    private void opcionMostrarEstudiantesOrdenados(List<Estudiante> estudiantes) {
        System.out.println("Ha seleccionado la opcion 1: Ordenar estudiantes por promedio e imprimir");
        VistaEstudiantesOperaciones.mostrarEstudiantesSortByPromedio(estudiantes);
    }

}
