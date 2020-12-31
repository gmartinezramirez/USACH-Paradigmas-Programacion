package com.paradigmas.shoppingsystem;

import com.paradigmas.shoppingsystem.controller.OrchestratorController;
import com.paradigmas.shoppingsystem.controller.ShoppingListController;
import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;
import com.paradigmas.shoppingsystem.repository.ShoppingListRepository;
import com.paradigmas.shoppingsystem.view.MainView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Main {
    /**
     * The main class, that is only responsible to build and connect together the components
     *
     * @param args
     */

    public static void main(String[] args) {

        ShoppingList initialShoppingList = setUpInitialShoppingList();
        final Scanner scanner = new Scanner(System.in);

        ShoppingListRepository shoppingListRepository = new ShoppingListRepository(initialShoppingList);
        ShoppingListController shoppingListController = new ShoppingListController(shoppingListRepository, scanner);

        MainView mainView = new MainView(scanner);

        OrchestratorController orchestratorController = new OrchestratorController(mainView, shoppingListController);
        orchestratorController.run();
    }

    private static ShoppingList setUpInitialShoppingList() {

        Article article1 = new Article("article1", 123.1, 1);
        Article article2 = new Article("article2", 999.9, 6);
        Article article3 = new Article("article3", 941.1, 5);
        List<Article> articles = new ArrayList<>(Arrays.asList(article1, article2, article3));
        return new ShoppingList("Lista de compras", articles, 0.0);
    }

}
