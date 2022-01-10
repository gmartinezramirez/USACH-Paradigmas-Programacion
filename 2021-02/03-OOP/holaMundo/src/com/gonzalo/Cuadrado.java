package com.gonzalo;

public class Cuadrado extends Figura {

    public Cuadrado(int numeroLados) {
        super(numeroLados);
    }

    @Override
    public int getArea() {
        return getNumeroLados() * 2;
    }

}
