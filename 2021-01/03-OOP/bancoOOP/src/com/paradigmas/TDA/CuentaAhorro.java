package com.paradigmas.TDA;

public class CuentaAhorro extends Cuenta {

    private int maxGiros;
    private int girosRealizados;

    public CuentaAhorro(long numero, boolean bloqueado, int saldo, int maxGiros) {
        super(numero, bloqueado, saldo);
        this.maxGiros = maxGiros;
        this.girosRealizados = 0;
    }

    @Override
    public void agregarDinero(int monto) {
        var nuevoMonto = this.getSaldo() + monto;
        this.setSaldo(nuevoMonto);
    }

    @Override
    public String obtenerInfo() {
        return "Hola soy Cuenta Ahorro";
    }
}
