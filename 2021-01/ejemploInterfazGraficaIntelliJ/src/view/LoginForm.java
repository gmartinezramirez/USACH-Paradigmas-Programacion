package view;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginForm extends JFrame {

    private JButton volverButton;
    private JTextField textField1;
    private JPasswordField passwordField1;

    public LoginForm() {
        super("Login");
        this.pack();
        volverButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println("holi");
            }
        });
    }

}
