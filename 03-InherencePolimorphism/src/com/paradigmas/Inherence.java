package com.paradigmas;

import com.paradigmas.TDA.Point2D;
import com.paradigmas.TDA.Point3D;

public class Inherence {

  public static void main(String[] args) {

    // Una línea 2D tiene dos dimensiones, x e y. Haciendo uso de herencia, ¿cómo implementaría una
    // línea 3D?
    // Una línea se compone de dos puntos. Punto inicio y punto final. Primero implemente mediante
    // composición la representación de una línea basada en la definición previamente escrita.
    // Luego, diseñe e implemente otra clase que contenga la representación de una línea, pero ahora
    // utilizando herencia. Es decir, una línea hereda el comportamiento de un punto.

    Point2D point2d = new Point2D(1, 2);
    System.out.println(point2d.toString());

    Point3D point3d = new Point3D(4, 6, 8);
    System.out.println(point3d.toString());
  }
}
