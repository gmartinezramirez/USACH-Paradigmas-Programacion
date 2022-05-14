package org.usach.template;

import org.usach.template.TDA.Menu;

import java.util.Scanner;

import static java.lang.System.exit;

public class Main {
    public static void main(String[] args) {

        var mainMenu = new Menu(TextConstants.MAIN_MENU_DIALOG);

        while (mainMenu.getSelectedOption() != MenuOptionConstants.MAIN_MENU_EXIT_OPTION) {

            mainMenu.printContextualDialog();
            var keyboardIn = new Scanner(System.in);
            mainMenu.setSelectedOption(keyboardIn.nextInt());

            switch (mainMenu.getSelectedOption()) {
                case MenuOptionConstants.MAIN_MENU_SUM_OPTION:
                    sumTwoNumbers(keyboardIn);
                    mainMenu.setSelectedOption(MenuOptionConstants.MAIN_MENU_DEFAULT_OPTION);
                    break;
                case MenuOptionConstants.MAIN_MENU_MULT_OPTION:
                    multTwoNumbers(keyboardIn);
                    mainMenu.setSelectedOption(MenuOptionConstants.MAIN_MENU_DEFAULT_OPTION);
                    break;
                case MenuOptionConstants.MAIN_MENU_EXIT_OPTION:
                    exit(0);
                default:
                    System.out.println("Ingrese opcion correcta");
            }
        }
    }

    private static void sumTwoNumbers(Scanner keyboardIn) {
        System.out.println("Ha seleccionado la opcion 1: Sumar dos numeros");
        System.out.println("Ingrese un numero y luego presione ENTER:");
        var inputFirstNumber = keyboardIn.nextInt();
        System.out.println("Ingrese otro numero y luego presione ENTER:");
        var inputSecondNumber = keyboardIn.nextInt();
        int sumBothInputs = inputFirstNumber + inputSecondNumber;
        System.out.println("La suma es: " + sumBothInputs);
    }

    private static void multTwoNumbers(Scanner keyboardIn) {
        System.out.println("Ha seleccionado la opcion 2: Multiplicar dos numeros");
        System.out.println("Ingrese un numero y luego presione ENTER:");
        var inputFirstNumberMult = keyboardIn.nextInt();
        System.out.println("Ingrese otro numero y luego presione ENTER:");
        var inputSecondNumberMult = keyboardIn.nextInt();
        int multBothInputs = inputFirstNumberMult * inputSecondNumberMult;
        System.out.println("La multiplicacion es: " + multBothInputs);
    }

}