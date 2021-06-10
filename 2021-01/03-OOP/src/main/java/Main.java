import TDA.Person;
import TDA.Pet;

import java.util.Arrays;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        System.out.println("hola a todos");
        Pet mascota = new Pet("migato");
        Pet segundaMascota = new Pet("miotrogato");
        List<Pet> pets = Arrays.asList(mascota, segundaMascota);

        Person persona = new Person("gonzalo", "martinez", 29, pets);
        System.out.println(persona.getAge());
        System.out.println(persona.getPets());
        System.out.println(persona.toString());

        for (Pet pet : persona.getPets()) {
            System.out.println(pet.getName());
        }

    }
}