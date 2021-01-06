package com.paradigmas.shoppingsystem.model;

import java.util.concurrent.atomic.AtomicInteger;

public class Article {

    private static final AtomicInteger counter = new AtomicInteger();
    private final int id;
    private final String name;
    private double price;
    private int quantity;

    public Article(String name, double price, int quantity) {
        this.id = counter.incrementAndGet();
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public String getName() {
        return name;
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

    public int getId() {
        return id;
    }
}
