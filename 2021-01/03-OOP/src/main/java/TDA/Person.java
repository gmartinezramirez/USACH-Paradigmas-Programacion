package TDA;

import java.util.List;

public class Person {

    String name;
    String lastname;
    int age;
    List<Pet> pets;

    public Person(String name, String lastname, int age, List<Pet> pets) {
        this.name = name;
        this.lastname = lastname;
        this.age = age;
        this.pets = pets;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public List<Pet> getPets() {
        return pets;
    }

    public void setPets(List<Pet> pets) {
        this.pets = pets;
    }

    @Override
    public String toString() {
        return "Person{" +
                "name='" + name + '\'' +
                ", lastname='" + lastname + '\'' +
                ", age=" + age +
                ", pets=" + pets +
                '}';
    }
}
