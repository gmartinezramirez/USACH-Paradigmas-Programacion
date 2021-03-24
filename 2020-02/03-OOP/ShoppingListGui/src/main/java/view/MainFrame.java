package view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class MainFrame extends JFrame implements ActionListener {

    private JLabel labelSomeAction;
    private JButton buttonSomeAction;
    private JButton buttonOpenAnotherFrame;



    public MainFrame() {
        super("Shopping List");
        initComponent();
        setSize(250, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        try {
            if (e.getSource() == buttonSomeAction) {
                String message = "Hola, esto es buttonSomeAction";
                JOptionPane.showMessageDialog(this, message);
            } else if (e.getSource() == buttonOpenAnotherFrame) {
                this.setVisible(false);
                new LoginFrame().setVisible(true);
            }
        } catch (Exception exception) {
            JOptionPane.showMessageDialog(this, "Error!");
        }
    }

    private void initComponent() {
        labelSomeAction = new JLabel("Esto es un label");
        buttonSomeAction = new JButton("Presioname para un dialog");
        buttonOpenAnotherFrame = new JButton("Presioname para un frame");

        // https://docs.oracle.com/javase/tutorial/uiswing/components/list.html
        // https://examples.javacodegeeks.com/desktop-java/swing/java-swing-list-example/
        // DefaultListModel nos permite habilitar que el componente lista va a cambiar (add/delete)
        // De forma grafica, se utiliza JList
        var listModel = new DefaultListModel();
        listModel.addElement("Jane Doe");
        listModel.addElement("John Smith");
        listModel.addElement("Kathy Green");
        var namesListComponent = new JList(listModel);

        java.util.List<String> usernames = new java.util.ArrayList<>();
        usernames.add("username1");
        usernames.add("username2");

        add(labelSomeAction);
        add(buttonSomeAction);
        add(buttonOpenAnotherFrame);
        add(namesListComponent); // Forma solo grafica

        setLayout(new FlowLayout());

        buttonSomeAction.addActionListener(this);
        buttonOpenAnotherFrame.addActionListener(this);
    }
}
