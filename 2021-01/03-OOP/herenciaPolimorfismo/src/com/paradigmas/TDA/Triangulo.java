package com.paradigmas.TDA;

public class Triangulo implements Figura {

    private int altura;
    private int base;

    public Triangulo(int altura, int base) {
        this.altura = altura;
        this.base = base;
    }

    @Override
    public int calcularArea() {
        return (altura*base)/2;
    }

    @Override
    public int calcularPerimetro() {
        return 2*altura*base;
    }
}
