public class Carta {

    private String simbolo;

    public Carta(String simbolo) {
        this.simbolo = simbolo;
    }

    public String getSimbolo() {
        return simbolo;
    }

    public void setSimbolo(String simbolo) {
        this.simbolo = simbolo;
    }

    private void algoPrivado() {
        System.out.println("holi");
    }

    @Override
    public String toString() {
        return "Carta{" +
                "simbolo='" + simbolo + '\'' +
                '}';
    }
}
