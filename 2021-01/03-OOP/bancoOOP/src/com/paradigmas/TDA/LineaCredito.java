package com.paradigmas.TDA;

public class LineaCredito extends Cuenta {

    private int montoAsignado;

    public LineaCredito(long numero, boolean bloqueado, int saldo, int montoAsignado) {
        super(numero, bloqueado, saldo);
        this.montoAsignado = montoAsignado;
    }


    @Override
    public void agregarDinero(int monto) {
        var nuevoMonto = this.getSaldo() + monto - 100000;
        this.setSaldo(nuevoMonto);
    }

    @Override
    public String obtenerInfo() {
        return "Hola soy LineaCredito";
    }
}
