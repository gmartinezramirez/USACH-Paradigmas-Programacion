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
        int frameWidth = 240;
        int frameHeight = 150;

        initComponents();

        setSize(frameWidth, frameHeight);
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

        setLayout(new FlowLayout());

        add(labelQuestion);
        add(labelWeight);
        add(fieldWeight);
        add(buttonTellMe);

        buttonTellMe.addActionListener(this);
    }

    private float calculateWaterAmount(float weight) {
        return (weight / 10f) * 0.4f;
    }
}