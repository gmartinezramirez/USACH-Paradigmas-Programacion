package com.paradigmas.view;

import com.paradigmas.TDA.Login;

import javax.swing.*;
import java.awt.event.*;

public class MainView extends JDialog {
    private JPanel contentPane;
    private JButton buttonLogin;
    private JButton buttonCancel;
    private JTextField userField;
    private JPasswordField passwordField;
    private JLabel usernameLabel;
    private JLabel passwordLabel;

    private Login login = new Login();

    public MainView() {
        setContentPane(contentPane);
        setModal(true);
        getRootPane().setDefaultButton(buttonLogin);

        buttonLogin.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onLogin();
            }
        });

        buttonCancel.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        });

        // call onCancel() when cross is clicked
        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                onCancel();
            }
        });

        // call onCancel() on ESCAPE
        contentPane.registerKeyboardAction(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        }, KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    }

    private void onLogin() {
        // add your code here
        //dispose();
        // Recuperar los valores que esten en los textField
        System.out.println("Estoy en el metodo onLogin");
        String username = userField.getText();
        String password = new String(passwordField.getPassword());
        System.out.println(username);
        System.out.println(password);
        if(login.isLoginSucessful(username, password)) {
            System.out.println("Login exitoso!");
            JOptionPane.showMessageDialog(this,
                    "Login exitoso po!");
        }

    }

    private void onCancel() {
        // add your code here if necessary
        System.out.println("apretaste cancel");
        dispose();
    }

    public static void main(String[] args) {
        MainView dialog = new MainView();
        dialog.pack();
        dialog.setVisible(true);
    }
}
