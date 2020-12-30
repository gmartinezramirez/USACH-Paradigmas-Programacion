package com.paradigmas.Service;

import com.paradigmas.TDA.Account;
import com.paradigmas.TDA.Client;

public class AccountValidationService {

  private boolean isAValidClient(Client aClient) {
    return aClient != null && aClient.isActive();
  }

  private boolean isAValidAccount(Account anAccount) {
    return anAccount != null && !anAccount.isBlocked();
  }

  // Solo dejamos visible al resto de los packages el metodo canClientOperate
  // esto es debido a que encapsulamos, los otros metodos de otras clases no tienen porque acceder
  // a isAValidClient y solo pueden acceder a este metodo
  public boolean canClientOperate(Client aClient) {
    return isAValidClient(aClient) && isAValidAccount(aClient.getAccount());
  }
}
