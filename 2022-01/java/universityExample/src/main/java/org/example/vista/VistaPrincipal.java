package org.example.vista;

import org.example.menu.Text;
import org.example.operaciones.VistaPrincipalOperaciones;
import org.example.tda.Estudiante;
import org.example.tda.Universidad;
import org.example.tda.menu.Menu;

import java.util.List;
import java.util.Scanner;

import static java.lang.System.exit;
import static org.example.menu.MenuPrincipalOptionConstants.*;

public class VistaPrincipal {

    // Universidad es el objeto que va ir cambiando
    // Funciona como el contenedor de Estudiantes, Profesores, Departamento, Cursos
    Universidad universidad;

    public VistaPrincipal(Universidad universidad) {
        this.universidad = universidad;
    }

    public void start() {
        var mainMenu = new Menu(Text.MAIN_MENU_DIALOG);

        while (mainMenu.getSelectedOption() != MAIN_MENU_EXIT_OPTION) {

            mainMenu.printContextualDialog();
            var keyboardIn = new Scanner(System.in);
            mainMenu.setSelectedOption(keyboardIn.nextInt());

            // Las opciones deben alterar el objeto Universidad
            // Esto ya que universidad es la "variable" o objeto global
            switch (mainMenu.getSelectedOption()) {
                case MAIN_MENU_MATRICULAR_ALUMNO:
                    opcionMatricularEstudiante(keyboardIn);
                    mainMenu.setSelectedOption(MAIN_MENU_DEFAULT_OPTION);
                    break;
                case MAIN_MENU_MOSTRAR_ALUMNOS:
                    opcionMostrarEstudiantes();
                    mainMenu.setSelectedOption(MAIN_MENU_DEFAULT_OPTION);
                    break;
                case MAIN_MENU_ENTER_VISTA_ALUMNOS:
                    opcionAccederMenuEstudiantes();
                    mainMenu.setSelectedOption(MAIN_MENU_DEFAULT_OPTION);
                    break;
                case MAIN_MENU_EXIT_OPTION:
                    exit(0);
                default:
                    System.out.println("Ingrese opcion correcta");
            }
        }
    }

    private void opcionMatricularEstudiante(Scanner keyboardIn) {
        System.out.println("Ha seleccionado la opcion 1: Matricular alumno en la universidad");
        System.out.println("Ingrese el nombre del estudiante:");
        var inputNombre = keyboardIn.next(); // next() captura strings, nextInt() captura int
        System.out.println("Ingrese el rut del estudiante:");
        var inputRut = keyboardIn.next();
        VistaPrincipalOperaciones.matricularEstudiante(universidad, inputNombre, inputRut);
    }

    private void opcionMostrarEstudiantes() {
        System.out.println("Ha seleccionado la opcion 2: Mostrar alumnos");
        VistaPrincipalOperaciones.mostrarEstudiantes(universidad);
    }

    private void opcionAccederMenuEstudiantes() {
        System.out.println("Ha seleccionado la opcion 3: Acceder vista de alumnos");
        //universidad.getEstudiantes()
        List<Estudiante> estudiantes = universidad.getEstudiantes();
        VistaEstudiantes vistaEstudiantes = new VistaEstudiantes(estudiantes);
        vistaEstudiantes.show();
    }

}
