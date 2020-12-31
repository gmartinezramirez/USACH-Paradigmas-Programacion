package com.paradigmas.shoppingsystem.model;

import java.util.List;

public class ShoppingList {

    private int id;
    private String name;
    private List<Article> articles;
    private double totalPrice;

    public ShoppingList(String name, List<Article> articles, double totalPrice) {
        this.name = name;
        this.articles = articles;
        this.totalPrice = totalPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
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