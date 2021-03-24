package com.paradigmas.TDA;

public class Figure {

  String color;
  int area;

  public Figure(String color) {
    this.color = color;
  }

  public String getColor() {
    return color;
  }

  public void setColor(String color) {
    this.color = color;
  }

  public int getArea() {
    return area;
  }

  public void setArea(int area) {
    this.area = area;
  }

  public void calculateArea() {
    System.out.println("Calculo de area");
  }
}
