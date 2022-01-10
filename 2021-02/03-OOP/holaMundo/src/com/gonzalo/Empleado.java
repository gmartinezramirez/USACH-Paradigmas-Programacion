package com.gonzalo;

public class Empleado implements Vendedor{

    String nombre;

    public Empleado(String nombre) {
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
        System.out.println("Hola soy empleado que vendo y saludo");
    }

    @Override
    public void vender() {
        System.out.println("Vendiendo");
    }
}
