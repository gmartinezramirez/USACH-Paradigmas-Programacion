package com.paradigmas.shoppingsystem;

import com.paradigmas.shoppingsystem.controller.MainController;
import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;
import com.paradigmas.shoppingsystem.view.MainView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    /**
     * The main class, that is only responsible to build and connect together the components
     *
     * @param args
     */

    public static void main(String[] args) {

        MainView mainView = new MainView();
        ShoppingList initialShoppingList = setUpInitialList();
        MainController mainController = new MainController(mainView, initialShoppingList);
        mainController.run();
    }

    private static ShoppingList setUpInitialList() {

        Article article1 = new Article("article1", 123.1, 1);
        Article article2 = new Article("article2", 999.9, 1);
        List<Article> articles = new ArrayList<>(Arrays.asList(article1, article2));
        return new ShoppingList("Lista de compras", articles, 0.0);
    }
}
