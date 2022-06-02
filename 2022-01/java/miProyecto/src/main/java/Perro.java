public class Perro implements Animal {
    @Override
    public void avanzar(int number) {
        System.out.println("Hola soy Perro y avanzo");
    }

    @Override
    public int avanzar(int number, int number2) {
        return 0;
    }

    @Override
    public int avanzar(int number, int number2, int number3) {
        return 0;
    }

    @Override
    public void avanzar(String number, int number2) {

    }

    @Override
    public void avanzar() {
        System.out.println("Hola soy Perro y avanzo");
    }

    @Override
    public void comer() {
        System.out.println("Hola soy Perro y como");
    }

}
