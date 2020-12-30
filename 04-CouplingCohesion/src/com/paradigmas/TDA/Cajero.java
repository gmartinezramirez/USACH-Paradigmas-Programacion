package com.paradigmas.TDA;

public class Cajero extends Employee {

    public Cajero(String name, int identificationNumber) {
        super(name, identificationNumber);
    }

    @Override
    public void setIncrementQuantityOfUserByDay() {
        System.out.println("Cajero");
        this.quantityOfUsersByDay += 1;
    }

}
