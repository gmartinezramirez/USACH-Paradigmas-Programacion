package com.paradigmas;

import com.paradigmas.Service.AccountOperationService;
import com.paradigmas.TDA.Account;
import com.paradigmas.TDA.Client;

public class CouplingCohesion {

  public static void main(String args[]) {

    // Un cliente tiene asociada una cuenta
    // Pueden modificarlo de acuerdo a nuestra sesion anterior en donde vimos composicion
    // El trabajo a futuro es extenderlo para que 1 cliente tenga N cuentas

    Account account1 = new Account(1234, 100);

    System.out.println(account1.getId());
    Account account2 = new Account(1235, 120);
    System.out.println(account2.getId());

    Client client1 = new Client(account1, "gonzalom", "pass");
    System.out.println(client1.toString());
    System.out.println(client1.getId());

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
    // AccountOperationService. Para esto instanciamos un objeto de esa clase y utilizamos sus métodos
    AccountOperationService accountOperationService = new AccountOperationService();
    accountOperationService.withdrawMoney(client1, 40);

    System.out.println(client1.getAccount().toString());
  }
}
