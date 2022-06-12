package org.example.tda.menu;

import static org.example.menu.MenuPrincipalOptionConstants.MAIN_MENU_DEFAULT_OPTION;

public class Menu {

    private int selectedOption;
    private String contextualDialog;

    public Menu(String contextualDialog) {
        this.selectedOption = MAIN_MENU_DEFAULT_OPTION;
        this.contextualDialog = contextualDialog;
    }

    public int getSelectedOption() {
        return selectedOption;
    }

    public void setSelectedOption(int selectedOption) {
        this.selectedOption = selectedOption;
    }

    public void printContextualDialog() {
        System.out.println(contextualDialog);
    }

}
