package com.paradigmas.TDA;

public class Circulo implements Figura {

    private int radio;
    static double PI = 3.141592653589793;

    public Circulo(int radio) {
        this.radio = radio;
    }

    @Override
    public int calcularArea() {
        return Double.intValue(PI*radio*radio);
    }

    @Override
    public int calcularPerimetro() {
        return 0;
    }


}
