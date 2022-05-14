package org.usach.template.TDA;

import java.util.Scanner;

public class Menu {

    private int selectedOption;
    private String contextualDialog;

    public Menu(String contextualDialog) {
        this.selectedOption = 0;
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
