package com.paradigmas;

public class Linea3D extends Linea2D {

    private int z;

    public Linea3D(int x, int y, int z) {
        super(x, y);
        this.z = z;
    }

    public int getZ() {
        return z;
    }

    public void setZ(int z) {
        this.z = z;
    }
}
