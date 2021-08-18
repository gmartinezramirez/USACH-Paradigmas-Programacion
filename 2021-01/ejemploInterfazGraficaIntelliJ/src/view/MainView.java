package view;

import javax.swing.*;
import java.awt.event.*;

public class MainView extends JDialog {
    private JPanel contentPane;
    private JButton buttonDoLogin;
    private JButton buttonDoRegister;
    private JButton exitButton;

    public MainView() {
        setContentPane(contentPane);
        setModal(true);
        getRootPane().setDefaultButton(buttonDoLogin);

        buttonDoLogin.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onDoLogin();
            }
        });

        buttonDoRegister.addActionListener(new ActionListener() {
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

    private void onDoLogin() {
        // add your code here
        dispose();
        new LoginForm().setVisible(true);
    }

    private void onCancel() {
        // add your code here if necessary
        dispose();
    }

    public static void main(String[] args) {
        MainView dialog = new MainView();
        dialog.pack();
        dialog.setVisible(true);
        //System.exit(0);
    }
}
