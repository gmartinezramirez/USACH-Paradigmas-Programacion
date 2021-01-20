package view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MainFrameView extends JFrame implements ActionListener {

    private JLabel labelSomeAction;
    private JButton buttonSomeAction;
    private JButton buttonOpenAnotherFrame;


    public MainFrameView() {
        super("Shopping List");
        initComponent();
        setSize(250, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            if (e.getSource() == buttonSomeAction) {
                String message = "Hola, esto es buttonSomeAction";
                JOptionPane.showMessageDialog(this, message);
            } else if (e.getSource() == buttonOpenAnotherFrame) {
                String message = "Hola, esto es button openAnotherFrame";
                JOptionPane.showMessageDialog(this, message);
            }
        } catch (Exception exception) {
            JOptionPane.showMessageDialog(this, "Error!");
        }
    }

    private void initComponent() {
        labelSomeAction = new JLabel("Esto es un label");
        buttonSomeAction = new JButton("Presioname para un dialog");
        buttonOpenAnotherFrame = new JButton("Presioname para un frame");

        add(labelSomeAction);
        add(buttonSomeAction);
        add(buttonOpenAnotherFrame);

        setLayout(new FlowLayout());

        buttonSomeAction.addActionListener(this);
        buttonOpenAnotherFrame.addActionListener(this);
    }
}
