package paradigmas;

import java.util.ArrayList;
import java.util.List;

public class Generics {

  // Escriba una programa que refleje el comportamiento de una calculadora, con los métodos de suma,
  // resta,
  // multiplicación y división que opere sobre 2 parametros de entrada.
  // Los parametros pueden ser números enteros o flotantes.
  // Luego, implemente los métodos necesarios para operar con una colección de elementos. \
  // Es decir, recibe una lista de números de un mismo tipo de datos, por ejemplo,
  // enteros y debe sumarlos. Utilice los conceptos de overloading (sobrecarga) y override
  // (sobreescritura)

  public static void main(String[] args) {

    System.out.println("Hello Generics");
    Calculadora calculadora = new Calculadora();
    System.out.println(calculadora.add(1.0, 2));

    List<Integer> aListOfIntegers = new ArrayList<>();
    aListOfIntegers.add(1);
    aListOfIntegers.add(9);
    System.out.println(calculadora.sumAllNumbers(aListOfIntegers));
  }
}
