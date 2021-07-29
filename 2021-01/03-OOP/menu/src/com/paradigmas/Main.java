package com.paradigmas;

import java.util.Scanner;

import static java.lang.System.exit;

public class Main {

    public static void main(String[] args) {
        var input = new Scanner(System.in);
        var selectedOption = 0;

        while (selectedOption != 3) {
            selectedOption = showMenu();
            switch (selectedOption) {
                case 1:
                    System.out.println("Ha seleccionado la opcion 1: Sumar dos numeros");
                    System.out.println("Ingrese un numero y luego presione ENTER:");
                    var inputFirstNumberSum = input.nextInt();
                    System.out.println("Ingrese otro numero y luego presione ENTER:");
                    var inputSecondNumberSum = input.nextInt();
                    int sumBothInputs = inputFirstNumberSum + inputSecondNumberSum;
                    System.out.println("La suma es: " + sumBothInputs);
                    break;
                case 2:
                    System.out.println("Ha seleccionado la opcion 2: Multiplicar dos numeros");
                    System.out.println("Ingrese un numero y luego presione ENTER:");
                    var inputFirstNumberMult = input.nextInt();
                    System.out.println("Ingrese otro numero y luego presione ENTER:");
                    var inputSecondNumberMult = input.nextInt();
                    int multBothInputs = inputFirstNumberMult * inputSecondNumberMult;
                    System.out.println("La multiplicacion es: " + multBothInputs);
                    break;
                case 3:
                    exit(0);
                default:
                    System.out.println("Ingrese opcion correcta");
            }
        }
    }

    public static int showMenu() {

        var selectedOption = 0;
        Scanner keyboardInput = new Scanner(System.in);
        System.out.println("Main Menu:");
        System.out.println("--------------");
        System.out.println("1.Sumar dos numeros");
        System.out.println("2.Multiplicar dos numeros");
        System.out.println("3.Salir");
        System.out.println("--------------");
        System.out.println("Ingrese su opcion (1,2 o 3) y luego aprete tecla ENTER:");
        selectedOption = keyboardInput.nextInt();

        return selectedOption;
    }

}
