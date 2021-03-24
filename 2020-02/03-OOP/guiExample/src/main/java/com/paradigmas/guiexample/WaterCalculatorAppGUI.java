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
    private JButton buttonOpenFrame;
    private JList namesListComponent;

    public WaterCalculatorAppGUI() {
        super("Water Calculator");
        initComponent();
        setSize(250, 200);
        setLocationRelativeTo(null); // Inicia al centro
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public static void main(String[] args) {
        new WaterCalculatorAppGUI().setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent event) {
        try {
            if(event.getSource()==buttonAction) {
                String message = "Amigo, necesitas tomar %.1f L de agua";
                float weight = Float.parseFloat(fieldWeight.getText());
                float amountWaterToDrink = calculateAmountOfWater(weight);
                message = String.format(message, amountWaterToDrink);
                JOptionPane.showMessageDialog(this, message);
            } else if (event.getSource() == buttonOpenFrame) {
                setVisible(false);
                new AnotherFrame().setVisible(true);
            }
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Valor incorrecto :(");
        }
    }

    private void initComponent() {
        labelQuestion = new JLabel("Cuanta agua deberías tomar?");
        labelWeight = new JLabel("Cuanto pesas en kg?");
        fieldWeight = new JTextField(5);
        buttonAction = new JButton("Presioname");
        buttonOpenFrame = new JButton("Abrir otra ventana");

        add(labelQuestion);
        add(labelWeight);
        add(fieldWeight);
        add(buttonAction);
        add(buttonOpenFrame);

        java.util.List<String> names = new java.util.ArrayList<>();
        names.add("gonzalo");
        names.add("maximiliano");
        names.add("mauricio");

        var listModel = new DefaultListModel();
        listModel.addElement("Jane Doe");
        listModel.addElement("John Smith");
        listModel.addElement("Kathy Green");
        var namesListComponent = new JList(listModel);

        for (String name: names) {
            listModel.addElement(name);
        }

        add(namesListComponent);

        // https://docs.oracle.com/javase/tutorial/uiswing/layout/flow.html
        setLayout(new FlowLayout());

        // ActionListener
        buttonAction.addActionListener(this);
        buttonOpenFrame.addActionListener(this);
    }

    private float calculateAmountOfWater(float weight) {
        return weight * 10;
    }

}
