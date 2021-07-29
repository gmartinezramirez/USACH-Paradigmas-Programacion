package com.paradigmas;

public class Terrorista extends Player {

    private String nombreLider;

    public Terrorista(String nombre, int vida, String nombreLider) {
        super(nombre, vida);
        this.nombreLider = nombreLider;
    }

    @Override
    public void holaMundo() {
        System.out.println("Hola Terrorista");
    }

    public String getNombreLider() {
        return nombreLider;
    }

    public void setNombreLider(String nombreLider) {
        this.nombreLider = nombreLider;
    }
}
