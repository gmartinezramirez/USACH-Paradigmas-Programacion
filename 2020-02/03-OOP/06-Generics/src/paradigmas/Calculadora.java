package paradigmas;

import java.util.List;

public class Calculadora {

  int Suma(int a, int b) {
    return a + b;
  }

  <T extends Number> float add(T one, T two) {
    return one.floatValue() + two.floatValue();
  }

  <T extends Number> int addReturnInt(T one, T two) {
    return one.intValue() + two.intValue();
  }

  <T extends Number> float sumAllNumbers(List<T> aList) {
    float accum = 0F;
    for (T item : aList) {
      accum = add(accum, item);
    }
    return accum;
  }
}
