package com.paradigmas.TDA;

public abstract class Employee {

    int id;
    String name;
    int identificationNumber;
    int quantityOfUsersByDay;

    public Employee(String name, int identificationNumber) {
        this.name = name;
        this.identificationNumber = identificationNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIdentificationNumber() {
        return identificationNumber;
    }

    public void setIdentificationNumber(int identificationNumber) {
        this.identificationNumber = identificationNumber;
    }


    public int getQuantityOfUsersByDay() {
        return quantityOfUsersByDay;
    }

    public void setIncrementQuantityOfUserByDay() {
        System.out.println("metodo");
    }

}
