package com.paradigmas.view;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AnotherFrame extends JFrame implements ActionListener {

    private JLabel miLabel;
    private JButton botonVolver;

    public AnotherFrame() {
        super("Nombre de mi segunda ventana");
        initComponents();
        setSize(500,500);
        setLocationRelativeTo(null);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == botonVolver) {
            this.setVisible(false);
            new MainFrame().setVisible(true);
        }
    }

    private void initComponents() {
        miLabel = new JLabel("Mi otro label");
        botonVolver = new JButton("Volver");

        add(miLabel);
        add(botonVolver);

        setLayout(new FlowLayout());
        botonVolver.addActionListener(this);
    }
}
