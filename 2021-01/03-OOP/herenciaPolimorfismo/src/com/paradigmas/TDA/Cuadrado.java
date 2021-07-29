package com.paradigmas.TDA;

public class Cuadrado implements Figura {

    private int valorLado;

    public Cuadrado(int valorLado) {
        this.valorLado = valorLado;
    }

    @Override
    public int calcularArea() {
        return valorLado*valorLado;
    }

    @Override
    public int calcularPerimetro() {
        return 4*valorLado;
    }
}
