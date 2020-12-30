package com.paradigmas;

import com.paradigmas.Service.AccountOperationService;
import com.paradigmas.Service.IAccountOperations;
import com.paradigmas.TDA.Account;
import com.paradigmas.TDA.Cajero;
import com.paradigmas.TDA.Client;
import com.paradigmas.TDA.Employee;

public class CouplingCohesion {

  public static void main(String[] args) {

    // Un cliente tiene asociada una cuenta
    // Pueden modificarlo de acuerdo a nuestra sesion anterior en donde vimos composicion
    // El trabajo a futuro es extenderlo para que 1 cliente tenga N cuentas

    Account account1 = new Account(1234, 100);

    System.out.println(account1.getId());
    Account account2 = new Account(1235, 120);
    System.out.println(account2.getId());

    Client client1 = new Client(account1, "gonzalom", "pass");
    // Imprimimos el contenido del objeto
    System.out.println(client1.toString());
    // Armamos un mensaje a imprimir
    String clientInfoMessage =
        "Client1 tiene el siguiente ID: ".concat(String.valueOf(client1.getId()));

    // Alternativa:
    // String clientInfoMessage =
    //        "Client1 tiene el siguiente ID: " + client1.getId();

    System.out.println(clientInfoMessage);

    // Un cliente solo puede cambiar su password si esta activo
    client1.setActive();
    client1.setPassword("new pass");
    System.out.println(client1.toString());

    // Podemos bloquear y desbloquear la cuenta bancaria de un usuario
    client1.getAccount().setBlocked();
    client1.getAccount().setUnblocked();
    System.out.println(client1.getAccount());

    // Para operar con la cuenta, encapsulamos toda la lógica de operaciones a un nuevo package
    // llamado Service
    // Toda la lógica que no es propia de un TDA, se agrupa en otro package. Por ejemplo
    // en este caso vamos a agrupar todo lo que sea manejo de dinero en la clase
    // AccountOperationService. Para esto instanciamos un objeto de esa clase y utilizamos sus
    // métodos
    // AccountOperationService accountOperationService = new AccountOperationService();

    IAccountOperations accountOperationService = new AccountOperationService();
    //     AccountOperationService accountOperationService = new AccountOperationService();
    accountOperationService.withdrawMoney(client1, 40);

    System.out.println(client1.getAccount().toString());

    System.out.println(client1.getAccount().getCurrentMoney());
    accountOperationService.addMoney(client1, 200);

    System.out.println(client1.getAccount().getCurrentMoney());

    // Employee
    Employee cajero = new Cajero("cajero", 1804551);

    // Cada vez que llamamos a este metodo, estaremos incrementando en 1 la cantidad de usuarios
    // que ha atendido en un dia
    cajero.setIncrementQuantityOfUserByDay();
    System.out.println(cajero.getQuantityOfUsersByDay());

    System.out.println(cajero.getQuantityOfUsersByDay());

    cajero.setIncrementQuantityOfUserByDay();
    System.out.println(cajero.getQuantityOfUsersByDay());
  }
}
