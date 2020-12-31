package com.paradigmas.shoppingsystem.repository;

import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ShoppingListRepository {

    private static ShoppingList setUpInitialList() {

        Article article1 = new Article("article1", 123.1, 1);
        Article article2 = new Article("article2", 999.9, 1);
        List<Article> articles = new ArrayList<>(Arrays.asList(article1, article2));
        return new ShoppingList("Lista de compras", articles, 0.0);
    }

}
