package com.paradigmas;

import javax.swing.*;
import java.awt.*;

public class Main {

    public static void main(String[] args) {

        JFrame miVentana = new JFrame("Hola soy el titulo de la ventana");

        JLabel componenteTexto = new JLabel("Hola soy texto");
        JButton boton = new JButton("Haz click aca");
        JTextField ingresoDeTexto = new JTextField("ingresa texto");

        miVentana.add(componenteTexto);
        miVentana.add(boton);
        miVentana.add(ingresoDeTexto);

        // https://docs.oracle.com/javase/tutorial/uiswing/layout/visual.html
        miVentana.setLayout(new FlowLayout());

        // comportamiento: colocar tamaño en X e Y de la ventana (frame)
        miVentana.setSize(500, 500);

        // comportamiento: dejar la ventana al centro de la pantalla
        miVentana.setLocationRelativeTo(null);

        // comportamiento: termina ejecucion del programa cuando se apreta la X de la ventana
        miVentana.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        // comportamiento: dejar ventana visible
        miVentana.setVisible(true);

    }
}
