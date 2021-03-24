package paradigmas.TDA;

public class Cat extends Animal implements IAnimal {

  public Cat(String name) {
    super(name, "cat");
  }

  public void doSound() {
    System.out.println("Miau maiu");
  }
}
