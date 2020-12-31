package com.paradigmas.shoppingsystem.view;

import java.util.Scanner;

public class MainView {

    private final Scanner scanner = new Scanner(System.in);

    public void run() {
        boolean canRunMenu = true;

        while (canRunMenu) {
            printMainMenuBanner();
            executeInteractiveUserInput(scanner);
        }
    }

    private void executeInteractiveUserInput(Scanner scanner) {
        String userInput = scanner.next();

        switch (userInput) {
            case "1":
                System.out.println("1");
                break;
            case "2":
                System.out.println("2");
                break;
            case "3":
                System.out.println("3");

            case "4":
                System.out.println("4");
                break;
            case "5":
                System.out.println("5");
                System.out.println("Terminando ejecución...");
                System.exit(0);
            default:
                System.out.println("Opción invalida. Vuelva a intentarlo...");
        }
    }

    private void printMainMenuBanner() {
        System.out.println("*****Sistema de listas de compras*****");
        System.out.println("1. Agregar una nueva lista de compra");
        System.out.println("2. Agregar un nuevo articulo a una lista de compras");
        System.out.println("3. Eliminar una lista de compra");
        System.out.println("4. Imprimir todas las listas de compras que tienes asociadas");
        System.out.println("5. Terminar programa");
        System.out.println("INTRODUZCA SU OPCIÓN:");
    }
}
