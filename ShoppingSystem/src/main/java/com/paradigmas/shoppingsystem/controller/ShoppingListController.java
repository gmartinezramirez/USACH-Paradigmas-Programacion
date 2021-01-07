package com.paradigmas.shoppingsystem.controller;

import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;
import com.paradigmas.shoppingsystem.repository.ShoppingListRepository;

import java.util.Scanner;

public class ShoppingListController {

    private final ShoppingListRepository shoppingListRepository;
    private final Scanner scanner;

    public ShoppingListController(ShoppingListRepository shoppingListRepository,
                                  Scanner scanner) {
        this.shoppingListRepository = shoppingListRepository;
        this.scanner = scanner;
    }

    public void addArticle() {
        printInfoBanner("4. Agregar un nuevo articulo a una lista de compras");
        Article article = new Article("new article", 400, 20);
        shoppingListRepository.addItem(article);
        //shoppingList.getArticles().add(article);
        System.out.println("Operación realizada con éxito!");
    }

    public void removeArticleByName() {
        printInfoBanner("5. Eliminar un articulo de la lista de compras ingresando su nombre");
        System.out.println("Ingrese el nombre del articulo a remover: ");
        String name = scanner.nextLine();
        shoppingListRepository.removeItemByName(name);
        System.out.println("Operación realizada con éxito!");
    }

    public void findArticleByName() {
        printInfoBanner("6. Obtener datos de un articulo ingresando su nombre");
        System.out.println("Ingrese el nombre del articulo a buscar: ");
        String name = scanner.nextLine();
        Article article = shoppingListRepository.findItemByName(name);
        System.out.println(article.toString());
        System.out.println("Operación realizada con éxito!");
    }

    public void printList() {
        printInfoBanner("7. Imprimir todos los articulos de la lista de compra ordenado según su precio de mayor a menor");
        ShoppingList currentShoppingList = shoppingListRepository.retrieve();
        System.out.println(currentShoppingList.toString());
        System.out.println("Operación realizada con éxito!");
    }

    private void printInfoBanner(String selectedOptionDescription) {
        System.out.println("Has escogido la opción: " + selectedOptionDescription);
    }

}
