package view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrameView extends JFrame implements ActionListener {

    private JLabel labelSomeAction;
    private JButton buttonSomeAction;

    public MainFrameView() {
        super("Shopping List");
        initComponent();
        setSize(250, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            String message = "Hola, esto es un mensaje";
            JOptionPane.showMessageDialog(this, message);
        } catch (Exception exception) {
            JOptionPane.showMessageDialog(this, "Error!");
        }
    }

    private void initComponent() {
        labelSomeAction = new JLabel("Esto es un label");
        buttonSomeAction = new JButton("Presioname");

        add(labelSomeAction);
        add(buttonSomeAction);

        setLayout(new FlowLayout());

        buttonSomeAction.addActionListener(this);
    }
}
