package com.paradigmas.shoppingsystem.controller;

import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;
import com.paradigmas.shoppingsystem.repository.ShoppingListRepository;

import java.util.Scanner;

public class ShoppingListController {

    private ShoppingListRepository shoppingListRepository;
    private Scanner scanner;

    public ShoppingListController(ShoppingListRepository shoppingListRepository,
                                  Scanner scanner) {
        this.shoppingListRepository = shoppingListRepository;
        this.scanner = scanner;
    }

    public void create() {
        //TODO
    }

    public void addArticle() {
        System.out.println("Has escogido la opción: " +
                "4. Agregar un nuevo articulo a una lista de compras");
        Article article = new Article("new article", 400, 20);
        shoppingListRepository.addArticle(article);
        System.out.println("Operación realizada con éxito!");
    }

    public void removeArticleByName() {
        System.out.println("Has escogido la opción: " +
                "5. Eliminar un articulo de la lista de compras ingresando su nombre");
        System.out.println("Ingrese el nombre del articulo a remover: ");
        String name = scanner.nextLine();
        shoppingListRepository.removeArticleByName(name);
        System.out.println("Operación realizada con éxito!");
    }

    public void findArticleByName() {
        System.out.println("Has escogido la opción: " +
                "6. Obtener datos de un articulo ingresando su nombre");
        System.out.println("Ingrese el nombre del articulo a buscar: ");
        String name = scanner.nextLine();
        Article article = shoppingListRepository.findArticleByName(name);
        System.out.println(article.toString());
        System.out.println("Operación realizada con éxito!");
    }

    public void printList() {
        System.out.println("Has escogido la opción: " +
                "7. Imprimir todos los articulos de la lista de compra ordenado según su precio de mayor a menor");
        ShoppingList currentShoppingList = shoppingListRepository.retrieve();
        System.out.println(currentShoppingList.toString());
        System.out.println("Operación realizada con éxito!");
    }

}
