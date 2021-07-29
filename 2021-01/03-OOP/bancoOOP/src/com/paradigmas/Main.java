package com.paradigmas;

import com.paradigmas.TDA.Cliente;
import com.paradigmas.TDA.Cuenta;
import com.paradigmas.TDA.CuentaAhorro;
import com.paradigmas.TDA.LineaCredito;

import java.util.ArrayList;
import java.util.List;

public class Main {

    public static void main(String[] args) {

        Cuenta miCuentaAhorro = new CuentaAhorro(0L, true, 10000, 100);
        Cuenta miLineaCredito = new LineaCredito(0L, true, 10000, 500);

        List<Cuenta> cuentas = new ArrayList<>();
        cuentas.add(miCuentaAhorro);
        cuentas.add(miLineaCredito);

        Cliente miCliente = new Cliente(0L, cuentas);
        System.out.println(miCliente.getCuentas().get(0).obtenerInfo());
        System.out.println(miCliente.getCuentas().get(0).getId());

        System.out.println(miCliente.getCuentas().get(1).obtenerInfo());
        System.out.println(miCliente.getCuentas().get(1).getId());

    }
}
