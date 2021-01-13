package com.paradigmas.guiexample;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class WaterAppGUI extends JFrame implements ActionListener {
    private JLabel labelQuestion;
    private JLabel labelWeight;
    private JTextField fieldWeight;
    private JButton buttonTellMe;

    public WaterAppGUI() {
        super("Water Calculator");
        int windowWidth = 240;
        int windowHeight = 150;

        initComponents();

        setSize(windowWidth, windowHeight);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public void actionPerformed(ActionEvent event) {
        String message = "Amigo, deberías tomar %.1f L de agua al día!";

        float weight = Float.parseFloat(fieldWeight.getText());
        float waterAmount = calculateWaterAmount(weight);

        message = String.format(message, waterAmount);

        JOptionPane.showMessageDialog(this, message);
    }

    public static void main(String[] args) {
        new WaterAppGUI().setVisible(true);
    }

    private void initComponents() {
        labelQuestion = new JLabel("Cuanta agua debería tomar?");
        labelWeight = new JLabel("Mi peso (kg):");
        fieldWeight = new JTextField(5);
        buttonTellMe = new JButton("Dime");

        // https://docs.oracle.com/javase/tutorial/uiswing/layout/flow.html
        setLayout(new FlowLayout());

        add(labelQuestion);
        add(labelWeight);
        add(fieldWeight);
        add(buttonTellMe);

        // https://stackoverflow.com/questions/15513380/how-to-open-a-new-window-by-clicking-a-button
        buttonTellMe.addActionListener(this);
    }

    private float calculateWaterAmount(float weight) {
        return (weight / 10f) * 0.4f;
    }
}