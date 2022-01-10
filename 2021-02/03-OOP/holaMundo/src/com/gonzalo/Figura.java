package com.gonzalo;

public class Figura {

    private int numeroLados;
    private int area;
    private int perimetro;


    public Figura(int numeroLados) {
        this.numeroLados = numeroLados;
    }

    public int getNumeroLados() {
        return numeroLados;
    }

    public void setNumeroLados(int numeroLados) {
        this.numeroLados = numeroLados;
    }

    public int getArea() {
        return 1;
    }

    public void setArea(int area) {
        this.area = area;
    }

    public int getPerimetro() {
        return perimetro;
    }

    public void setPerimetro(int perimetro) {
        this.perimetro = perimetro;
    }

    @Override
    public String toString() {
        return "Figura{" +
                "numeroLados=" + numeroLados +
                ", area=" + area +
                ", perimetro=" + perimetro +
                '}';
    }
}
