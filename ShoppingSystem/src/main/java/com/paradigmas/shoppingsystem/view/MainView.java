package com.paradigmas.shoppingsystem.view;

import com.paradigmas.shoppingsystem.controller.OrchestratorController;

import java.util.Scanner;

public class MainView {

    private final Scanner scanner;

    public MainView(Scanner scanner) {
        this.scanner = scanner;
    }

    public void run(OrchestratorController orchestratorController) {
        boolean canRunMenu = true;

        while (canRunMenu) {
            printMainMenuBanner();
            prompt(orchestratorController);
        }
    }

    private void prompt(OrchestratorController orchestratorController) {
        String userInput = scanner.nextLine();

        switch (userInput) {
            case "1":
                System.out.println("TODO");
                break;
            case "2":
                System.out.println("TODO");
                break;
            case "3":
                System.out.println("TODO");
                break;
            case "4":
                orchestratorController.getShoppingListController().addArticle();
                break;
            case "5":
                orchestratorController.getShoppingListController().removeArticleByName();
                break;
            case "6":
                orchestratorController.getShoppingListController().findArticleByName();
                break;
            case "7":
                orchestratorController.getShoppingListController().printList();
                break;
            case "8":
                orchestratorController.getShoppingListController().printList();
                break;
            case "9":
                System.out.println("Terminando ejecución...");
                System.exit(0);
            default:
                System.out.println("Opción invalida. Vuelva a intentarlo...");
        }
    }

    private void printMainMenuBanner() {
        System.out.println("*****Sistema de listas de compras*****");
        System.out.println("1. Agregar una nueva lista de compra");
        System.out.println("2. Eliminar una lista de compra");
        System.out.println("3. Imprimir todas las listas de compras que tienes asociadas");
        System.out.println("4. Agregar un nuevo articulo a una lista de compras");
        System.out.println("5. Eliminar un articulo de la lista de compras");
        System.out.println("6. Obtener datos de un articulo ingresando su nombre");
        System.out.println("7. Imprimir todos los articulos de la lista de compra ordenado según su precio de mayor a menor");
        System.out.println("8. Filtrar articulos basado en el precio");
        System.out.println("9. Terminar programa");
        System.out.println("INTRODUZCA SU OPCIÓN:");
    }
}
