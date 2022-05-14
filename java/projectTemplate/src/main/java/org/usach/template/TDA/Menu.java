package org.usach.template.TDA;

import java.util.Scanner;

public class Menu {

    private int selectedOption;
    private String contextualDialog;

    public Menu(int selectedOption, String contextualDialog) {
        this.selectedOption = selectedOption;
        this.contextualDialog = contextualDialog;
    }

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

    public String getContextualDialog() {
        return contextualDialog;
    }

    public void setContextualDialog(String contextualDialog) {
        this.contextualDialog = contextualDialog;
    }

    public void printContextualDialog() {
        System.out.println(contextualDialog);
    }

}
