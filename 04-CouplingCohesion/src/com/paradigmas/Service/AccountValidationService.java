package com.paradigmas.Service;

import com.paradigmas.TDA.Account;
import com.paradigmas.TDA.Client;

public class AccountValidationService {

  private boolean isAValidClient(Client aClient) {
    if (aClient != null && aClient.isActive()) {
      return true;
    }
    return false;
  }

  private boolean isAValidAccount(Account anAccount) {
    if (anAccount != null && !anAccount.isBlocked()) {
      return true;
    }
    return false;
  }

  // Solo dejamos visible al resto de los packages el metodo canClientOperate
  // esto es debido a que encapsulamos, los otros metodos de otras clases no tienen porque acceder
  // a isAValidClient y solo pueden acceder a este metodo
  public boolean canClientOperate(Client aClient) {
    if (isAValidClient(aClient) && isAValidAccount(aClient.getAccount())) {
      return true;
    }
    return false;
  }
}
