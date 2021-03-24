package com.paradigmas.TDA;

public class Rectangule extends Figure {

  int length;
  int width;

  public Rectangule(String color, int length, int width) {
    super(color);
    this.length = length;
    this.width = width;
  }

  @Override
  public void calculateArea() {
    this.area = this.length * this.width;
  }

  @Override
  public String toString() {
    return "Rectangule{"
        + "color='"
        + color
        + '\''
        + ", area="
        + area
        + ", largo="
        + length
        + ", width="
        + width
        + '}';
  }
}
