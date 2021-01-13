package com.paradigmas.guiexample;


import javax.swing.*;

public class HelloWorldGUI extends JFrame {

    public HelloWorldGUI() {
        JFrame frame = new JFrame("HelloWorldSwing");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        JLabel label = new JLabel("Hello World");
        frame.getContentPane().add(label);

        // Display the window.
        frame.pack();
        frame.setVisible(true);
    }

    public static void main(String[] args) {
        System.out.println("Hello Gui");
        new HelloWorldGUI();
    }

}
