package com.paradigmas.TDA;

public class Point3D extends Point2D {

  int z;

  public Point3D(int x, int y, int z) {
    super(x, y);
    this.x = 20;
    this.z = z;
  }

  public int getZ() {
    return z;
  }

  public void setZ(int z) {
    this.z = z;
  }

  @Override
  public String toString() {
    return "Point3D{" + "x=" + x + ", y=" + y + ", z=" + z + '}';
  }
}
