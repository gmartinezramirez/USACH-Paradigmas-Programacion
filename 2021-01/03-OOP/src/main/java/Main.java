import TDA.Person;
import TDA.Pet;

public class Main {

    public static void main(String[] args) {
        System.out.println("hola a todos");
        Pet mascota = new Pet("migato");
        Person persona = new Person("gonzalo", "martinez", 29, mascota);
        System.out.println(persona.getAge());
        System.out.println(persona.getPet().getName());
        System.out.println(persona.toString());
    }
}