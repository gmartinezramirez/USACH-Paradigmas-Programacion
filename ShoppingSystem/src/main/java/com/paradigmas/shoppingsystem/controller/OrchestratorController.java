package com.paradigmas.shoppingsystem.controller;

import com.paradigmas.shoppingsystem.view.MainView;

public class OrchestratorController {

    MainView mainView;
    ShoppingListController shoppingListController;

    public OrchestratorController(MainView mainView,
                                  ShoppingListController shoppingListController) {
        this.mainView = mainView;
        this.shoppingListController = shoppingListController;
    }

    public void run() {
        mainView.run(this);
    }

    public ShoppingListController getShoppingListController() {
        return shoppingListController;
    }

}
