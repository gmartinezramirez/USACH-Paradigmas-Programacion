package com.gonzalo;

public class Guardia implements Vendedor {

    String nombre;

    public Guardia(String nombre) {
        this.nombre = nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    @Override
    public void saludar() {
        System.out.println("Hola soy el guardia que vendo y saludo");
    }

    @Override
    public void vender() {

    }
}
