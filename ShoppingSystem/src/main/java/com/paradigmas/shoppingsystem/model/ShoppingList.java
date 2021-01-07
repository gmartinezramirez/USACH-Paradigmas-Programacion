package com.paradigmas.shoppingsystem.model;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public class ShoppingList {

    private static final AtomicInteger counter = new AtomicInteger();
    private final String id;
    private String name;
    private List<Article> articles;
    private double totalPrice;

    public ShoppingList(String name, List<Article> articles, double totalPrice) {
        this.id = "S" + counter.incrementAndGet();
        this.name = name;
        this.articles = articles;
        this.totalPrice = totalPrice;
    }

    public List<Article> getArticles() {
        return articles;
    }

    @Override
    public String toString() {
        return "ShoppingList{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", articles=" + articles +
                ", totalPrice=" + totalPrice +
                '}';
    }
}