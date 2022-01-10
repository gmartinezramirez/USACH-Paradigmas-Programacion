package com.gonzalo;

public class Punto3D extends Punto2D {

    private int z;

    public Punto3D(int x, int y) {
        super(x, y);
        //this.x = x;
        //this.y = y;

        //this.z = 0
    }

    // Overload
    public Punto3D(int x, int y, int z) {
        super(x, y);
        //this.x = x;
        //this.y = y;
        this.z = z;
    }

    public int getZ() {
        return z;
    }

    public void setZ(int z) {
        this.z = z;
    }
}
