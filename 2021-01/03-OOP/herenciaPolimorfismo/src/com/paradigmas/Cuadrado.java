package com.paradigmas;

public class Cuadrado extends Figura {

    private int x;
    private int y;

    public Cuadrado(String color, int x, int y) {
        super(color);
        this.x = x;
        this.y = y;
    }

    @Override
    public double calcularArea() {
        return x*y;
    }
}
