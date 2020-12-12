package com.paradigmas;

import com.paradigmas.TDA.Figure;
import com.paradigmas.TDA.Rectangule;

public class Polimorphism {
  public static void main(String args[]) {

    Rectangule rectangule1 = new Rectangule("color", 1, 2); // Herencia
    Figure rectangule2 = new Rectangule("color", 1, 2); // Polimorfismo
    System.out.println(rectangule1.toString());
    rectangule2.calculateArea();
    System.out.println(rectangule2.toString());
    System.out.println(rectangule2.getArea());
  }
}
