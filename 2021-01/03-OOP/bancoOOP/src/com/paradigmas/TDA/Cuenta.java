package com.paradigmas.TDA;

public abstract class Cuenta {

    // Id autoincremental
    private static int count = 0;
    private static long numero;
    private int id;
    private boolean bloqueado;
    private int saldo;

    public Cuenta(long numero, boolean bloqueado, int saldo) {
        // Id autoincremental
        setId(++count);
        this.numero = numero;
        this.bloqueado = bloqueado;
        this.saldo = saldo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getNumero() {
        return numero;
    }

    public void setNumero(long numero) {
        this.numero = numero;
    }

    public boolean isBloqueado() {
        return bloqueado;
    }

    public void setBloqueado(boolean bloqueado) {
        this.bloqueado = bloqueado;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(int saldo) {
        this.saldo = saldo;
    }

    // Metodos abstractos
    // Un metodo abstracto es aquel que no tiene implementacion
    // Una interface viene a ser una clase solo con metodos abstractos
    public abstract void agregarDinero(int monto);

    public abstract String obtenerInfo();

}
