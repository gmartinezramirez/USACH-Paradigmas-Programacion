package paradigmas;

import paradigmas.TDA.Animal;
import paradigmas.TDA.Cat;
import paradigmas.TDA.Dog;

public class AbstractInterface {

  public static void main(String args[]) {
    Animal dog = new Dog("mascota", 10);

    Cat cat = new Cat("gato");
    cat.doSound();
  }
}
