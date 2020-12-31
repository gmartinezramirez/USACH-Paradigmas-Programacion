package com.paradigmas.shoppingsystem.controller;

import com.paradigmas.shoppingsystem.repository.ShoppingListRepository;
import com.paradigmas.shoppingsystem.view.MainView;

public class MainController {

    MainView mainView;
    ShoppingListRepository shoppingListRepository;

    public MainController(MainView mainView, ShoppingListRepository shoppingListRepository) {
        this.mainView = mainView;
        this.shoppingListRepository = shoppingListRepository;
    }

    public void run() {
        mainView.run(this);
    }

    public void firstJob() {
        System.out.println("Hello 1");
    }

    public void secondJob() {
        System.out.println("Hello 2");
    }

    public void thirdJob() {
        System.out.println("Hello 3");
    }

    public void fourJob() {
        System.out.println("Hello 4");
    }

}
