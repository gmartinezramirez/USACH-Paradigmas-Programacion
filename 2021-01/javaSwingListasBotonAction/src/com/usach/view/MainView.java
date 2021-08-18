package com.usach.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

public class MainView extends JFrame implements ActionListener {

    private JLabel labelSomeAction;
    private JButton buttonSomeAction;
    private JButton buttonOpenAnotherFrame;
    private JTextField usernameField;
    private DefaultListModel usernamesComponentListContent = new DefaultListModel<>();


    public MainView() {
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
                //String message = "Hola, esto es buttonSomeAction";
                this.usernamesComponentListContent.addElement("uno nuevo \n");
                this.usernamesComponentListContent.addElement(usernameField.getText());
                //JOptionPane.showMessageDialog(this, message);
            } else if (e.getSource() == buttonOpenAnotherFrame) {
                this.setVisible(false);
                //new LoginFrame().setVisible(true);
            }
        } catch (Exception exception) {
            JOptionPane.showMessageDialog(this, "Error!");
        }
    }

    private void initComponent() {
        labelSomeAction = new JLabel("Esto es un label");
        buttonSomeAction = new JButton("Presioname para un dialog");
        buttonOpenAnotherFrame = new JButton("Presioname para un frame");
        usernameField = new JTextField();


        // https://docs.oracle.com/javase/tutorial/uiswing/components/list.html
        // https://examples.javacodegeeks.com/desktop-java/swing/java-swing-list-example/
        // DefaultListModel nos permite habilitar que el componente lista va a cambiar (add/delete)
        // De forma grafica, se utiliza JList

        // List
        // JList
        List<String> usernames = new ArrayList<>();
        usernames.add("username1list");
        usernames.add("username2list");
        usernames.add("username3list");

        //var listModel = new DefaultListModel<>();
        //listModel.addElement("username1");
        //listModel.addElement("username2");
        //listModel.addElement("username3");


        for (String username : usernames) {
            usernamesComponentListContent.addElement(username);
        }

        JList listComponent = new JList(usernamesComponentListContent);


        add(labelSomeAction);
        add(buttonSomeAction);
        add(buttonOpenAnotherFrame);
        add(listComponent);
        add(usernameField);

        setLayout(new FlowLayout());

        buttonSomeAction.addActionListener(this);
        buttonOpenAnotherFrame.addActionListener(this);
    }
}
