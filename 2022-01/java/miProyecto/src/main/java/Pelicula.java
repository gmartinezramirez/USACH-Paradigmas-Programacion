public class Pelicula {
    // int: integer   2 3 4
    // Int:    Int.toFloat()  .toString() .toQueSeYO()
    // float:
    // char:
    // String: objeto
    // boolean: true or false
    // Boolean:

    private int year;
    private String name;
    private Persona director;

    public Pelicula(int year, String name, Persona director) {
        this.year = year;
        this.name = name;
        this.director = director;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDirector() {
        return director.getNombre();
    }

    public void setDirector(Persona director) {
        this.director = director;
    }

    @Override
    public String toString() {
        return "Pelicula{" +
                "year=" + year +
                ", name='" + name + '\'' +
                ", director='" + director + '\'' +
                '}';
    }
}
