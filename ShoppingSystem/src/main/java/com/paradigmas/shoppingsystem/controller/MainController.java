package com.paradigmas.shoppingsystem.controller;

import com.paradigmas.shoppingsystem.model.ShoppingList;
import com.paradigmas.shoppingsystem.view.MainView;

public class MainController {

    MainView mainView;
    ShoppingList shoppingList;

    public MainController(MainView mainView, ShoppingList shoppingList) {
        this.mainView = mainView;
        this.shoppingList = shoppingList;
    }

    public void run() {
        mainView.run();
    }

}
