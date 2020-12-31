package com.paradigmas.shoppingsystem.model;

public class Article {

    private int id;
    private String name;
    private double price;
    private int quantity;

    public Article(String name, double price, int quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Article{"
                + "id="
                + id
                + ", name='"
                + name
                + '\''
                + ", price="
                + price
                + ", quantity="
                + quantity
                + '}';
    }
}
