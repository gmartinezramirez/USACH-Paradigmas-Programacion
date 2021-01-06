package com.paradigmas.shoppingsystem.controller;

import com.paradigmas.shoppingsystem.view.TextUserApplication;

public class OrchestratorController implements Orchestrator {

    private final TextUserApplication textUserApplication;
    private final ShoppingListController shoppingListController;

    public OrchestratorController(TextUserApplication textUserApplication,
                                  ShoppingListController shoppingListController) {
        this.textUserApplication = textUserApplication;
        this.shoppingListController = shoppingListController;
    }

    @Override
    public void execute() {
        textUserApplication.execute(this);
    }

    public ShoppingListController getShoppingListController() {
        return shoppingListController;
    }

}
