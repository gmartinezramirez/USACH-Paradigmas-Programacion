package com.paradigmas.shoppingsystem.view;

import com.paradigmas.shoppingsystem.controller.MainController;

import java.util.Scanner;

public class MainView {

    private final Scanner scanner = new Scanner(System.in);

    public void run(MainController mainController) {
        boolean canRunMenu = true;

        while (canRunMenu) {
            printMainMenuBanner();
            prompt(scanner, mainController);
        }
    }

    private void prompt(Scanner scanner, MainController mainController) {
        String userInput = scanner.next();

        switch (userInput) {
            case "1":
                System.out.println("1");
                mainController.firstJob();
                System.out.println("End 1");
                break;
            case "2":
                System.out.println("2");
                mainController.secondJob();
                System.out.println("End 2");
                break;
            case "3":
                System.out.println("3");
                mainController.thirdJob();
                System.out.println("End 3");
                break;
            case "4":
                System.out.println("4");
                mainController.fourJob();
                System.out.println("End 4");
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
