package com.paradigmas.shoppingsystem.repository;

import com.paradigmas.shoppingsystem.model.Article;
import com.paradigmas.shoppingsystem.model.ShoppingList;

import java.util.List;

public class ShoppingListRepository {

    private final ShoppingList shoppingList;

    public ShoppingListRepository(ShoppingList shoppingList) {
        this.shoppingList = shoppingList;
    }

    public ShoppingList retrieve() {
        return shoppingList;
    }

    public void addArticle(Article article) {
        shoppingList.getArticles().add(article);
    }

    public void removeArticleByName(String name) {
        // Ref: https://stackoverflow.com/questions/36028995/remove-object-from-arraylist-with-some-object-property
        shoppingList.getArticles()
                .removeIf(article -> article.getName().equalsIgnoreCase(name));
    }

    public Article findArticleByName(String name) {
        // Ref: https://www.baeldung.com/find-list-element-java
        return shoppingList.getArticles().stream()
                .filter(article -> article.getName().equalsIgnoreCase(name))
                .findAny()
                .orElse(null);
    }

    public List<Article> getArticles() {
        return shoppingList.getArticles();
    }


}
