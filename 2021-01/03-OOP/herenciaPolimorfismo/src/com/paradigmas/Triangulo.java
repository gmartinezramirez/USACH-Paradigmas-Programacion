package com.paradigmas;

public class Triangulo extends Figura {

    private int base;
    private int altura;

    public Triangulo(String color, int base, int altura) {
        super(color);
        this.base = base;
        this.altura = altura;
    }

    @Override
    public double calcularArea() {
        return 0.5*base*altura;
    }

}
