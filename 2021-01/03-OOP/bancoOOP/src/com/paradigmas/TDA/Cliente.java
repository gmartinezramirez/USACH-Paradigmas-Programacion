package com.paradigmas.TDA;

import java.util.List;

public class Cliente {

    private long id;
    private List<Cuenta> cuentas;

    public Cliente(long id, List<Cuenta> cuentas) {
        this.id = id;
        this.cuentas = cuentas;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Cuenta> getCuentas() {
        return cuentas;
    }

    public void setCuentas(List<Cuenta> cuentas) {
        this.cuentas = cuentas;
    }
}
