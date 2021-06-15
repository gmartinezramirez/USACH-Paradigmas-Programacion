import TDA.Mascota;
import TDA.Persona;

public class Main {

    public static void main(String[] args) {

        Mascota mascota = new Mascota("miGato");
        Persona persona = new Persona("Gonzalo", 29, mascota);
        System.out.println(persona.getNombre());
        System.out.println(persona.getEdad());
        System.out.println(persona.toString());
        persona.setEdad(20);
        System.out.println(persona.getEdad());
        System.out.println(persona.toString());

        System.out.println(persona.getMascota().getNombre());

        // sout  tab
        //Anda a la libreria interna System, a la clase out y ocupa el metodo println
        // Print new line
        //persona.getNombre();
    }
}
