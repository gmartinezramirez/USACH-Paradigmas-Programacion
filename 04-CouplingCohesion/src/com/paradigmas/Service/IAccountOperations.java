package com.paradigmas.Service;

import com.paradigmas.TDA.Client;

public interface IAccountOperations {

    void withdrawMoney(Client aClient, int aValue);

    void addMoney(Client aClient, int aValue);

}
