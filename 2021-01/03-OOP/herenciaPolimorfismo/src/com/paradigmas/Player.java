package com.paradigmas;

public class Player {

    private String nombre;
    private int vida;

    public Player(String nombre, int vida) {
        this.nombre = nombre;
        this.vida = vida;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getVida() {
        return vida;
    }

    public void setVida(int vida) {
        this.vida = vida;
    }

    public void holaMundo() {
        System.out.println("Hola Player");
    }


}
