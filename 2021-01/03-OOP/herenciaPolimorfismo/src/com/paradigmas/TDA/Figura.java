package com.paradigmas.TDA;

public interface Figura<E> {
//E: Element     T: Type   G: generics
        <E> E calcularArea();

        int calcularPerimetro();
}
