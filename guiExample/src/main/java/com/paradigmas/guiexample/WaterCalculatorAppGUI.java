package com.paradigmas.guiexample;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class WaterCalculatorAppGUI extends JFrame implements ActionListener {

    private JLabel labelQuestion;
    private JLabel labelWeight;
    private JTextField fieldWeight;
    private JButton buttonAction;

    public WaterCalculatorAppGUI() {
        super("Water Calculator");
        initComponent();
        setSize(250, 200);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {
        new WaterCalculatorAppGUI().setVisible(true);
    }

    public void actionPerformed(ActionEvent event) {
        try {
            String message = "Amigo, necesitas tomar %.1f L de agua";
            float weight = Float.parseFloat(fieldWeight.getText());
            float amountWaterToDrink = calculateAmountOfWater(weight);
            message = String.format(message, amountWaterToDrink);
            JOptionPane.showMessageDialog(this, message);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Valor incorrecto :(");
        }
    }

    private void initComponent() {
        labelQuestion = new JLabel("Cuanta agua deberías tomar?");
        labelWeight = new JLabel("Cuanto pesas en kg?");
        fieldWeight = new JTextField(5);
        buttonAction = new JButton("Presioname");

        add(labelQuestion);
        add(labelWeight);
        add(fieldWeight);
        add(buttonAction);

        // https://docs.oracle.com/javase/tutorial/uiswing/layout/flow.html
        setLayout(new FlowLayout());

        // ActionListener
        buttonAction.addActionListener(this);
    }

    private float calculateAmountOfWater(float weight) {
        return weight * 10;
    }

}
