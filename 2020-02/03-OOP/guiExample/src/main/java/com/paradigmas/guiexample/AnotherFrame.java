package com.paradigmas.guiexample;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AnotherFrame extends JFrame implements ActionListener {

    private JButton buttonBackToMain;

    public AnotherFrame() {
        super("Water Calculator");
        initComponent();
        setSize(250, 200);
        setLocationRelativeTo(null); // Inicia al centro
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
    }

    @Override
    public void actionPerformed(ActionEvent event) {
        try {
            setVisible(false);
            new WaterCalculatorAppGUI().setVisible(true);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Valor incorrecto :(");
        }
    }

    private void initComponent() {
        buttonBackToMain = new JButton("Volver a vista main");
        add(buttonBackToMain);
        setLayout(new FlowLayout());
        buttonBackToMain.addActionListener(this);
    }

}
