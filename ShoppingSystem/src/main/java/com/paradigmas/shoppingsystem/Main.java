package com.paradigmas.shoppingsystem;

import com.paradigmas.shoppingsystem.controller.Orchestrator;
import com.paradigmas.shoppingsystem.controller.OrchestratorController;
import com.paradigmas.shoppingsystem.controller.ShoppingListController;
import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;
import com.paradigmas.shoppingsystem.repository.ShoppingListRepository;
import com.paradigmas.shoppingsystem.view.MainView;
import com.paradigmas.shoppingsystem.view.TextUserApplication;

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

        final Scanner scanner = new Scanner(System.in);
        ShoppingList initialShoppingList = setUpInitialShoppingList();

        ShoppingListRepository shoppingListRepository =
                new ShoppingListRepository(initialShoppingList);
        ShoppingListController shoppingListController =
                new ShoppingListController(shoppingListRepository, scanner);

        TextUserApplication textUserApplication = new MainView(scanner);

        Orchestrator orchestrator =
                new OrchestratorController(textUserApplication, shoppingListController);
        orchestrator.execute();
    }

    private static ShoppingList setUpInitialShoppingList() {

        List<Article> articles = new ArrayList<>(Arrays.asList(
                new Article("article1", 123.1, 1),
                new Article("article2", 999.9, 6),
                new Article("article3", 941.1, 5)));
        return new ShoppingList("Lista de compras", articles, 0.0);
    }

}
