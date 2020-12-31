package com.paradigmas.shoppingsystem;

import com.paradigmas.shoppingsystem.controller.MainController;
import com.paradigmas.shoppingsystem.repository.ShoppingListRepository;
import com.paradigmas.shoppingsystem.view.MainView;

public class Main {
    /**
     * The main class, that is only responsible to build and connect together the components
     *
     * @param args
     */

    public static void main(String[] args) {

        MainView mainView = new MainView();
        ShoppingListRepository shoppingListRepository = new ShoppingListRepository();
        MainController mainController = new MainController(mainView, shoppingListRepository);
        mainController.run();
    }


}
