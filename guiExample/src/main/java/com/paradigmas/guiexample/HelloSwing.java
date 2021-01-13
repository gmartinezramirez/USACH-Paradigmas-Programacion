package com.paradigmas.guiexample;

import javax.swing.*;

public class HelloSwing {
    // Interfaz grafica utilizando Swing y AWT
    public static void main(String[] args) {
        JFrame frame = new JFrame("Hola mundo");
        JLabel label = new JLabel("Esto es un label");
        JButton button = new JButton("Boton");
        JTextField field = new JTextField("Esto es un field");

        // Dar comportamiento a la ventana (frame)
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 500);
        //frame.getContentPane().add(label);
        frame.add(label);
        //frame.add(button);
        frame.add(field);

        // Dar visibilidad del frame
        // Adecuarlo a contenido del frame
        //frame.pack();
        frame.setVisible(true);

    }

}
