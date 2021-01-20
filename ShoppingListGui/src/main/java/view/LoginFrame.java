package view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class LoginFrame extends JFrame implements ActionListener {

    private JLabel labelUsername;
    private JButton buttonDoLogin;
    private JButton buttonBack;


    public LoginFrame() {
        super("Login");
        initComponent();
        setSize(200, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            if (e.getSource() == buttonDoLogin) {
                String message = "Hola, esto es buttonSomeAction";
                JOptionPane.showMessageDialog(this, message);
            } else if (e.getSource() == buttonBack) {
                dispose();
                new MainFrame().setVisible(true);
            }
        } catch (Exception exception) {
            JOptionPane.showMessageDialog(this, "Error!");
        }
    }

    private void initComponent() {
        labelUsername = new JLabel("Username");
        buttonDoLogin = new JButton("Login");
        buttonBack = new JButton("Back");

        add(labelUsername);
        add(buttonDoLogin);
        add(buttonBack);

        setLayout(new FlowLayout());

        buttonDoLogin.addActionListener(this);
        buttonBack.addActionListener(this);
    }

}
