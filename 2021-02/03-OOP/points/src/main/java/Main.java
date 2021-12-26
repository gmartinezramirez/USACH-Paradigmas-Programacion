public class Main {

    public static void main(String[] args) {
        Point p1 = new Point(3, 4);
        Point p2 = new Point(6, 8);

        System.out.println(p1.toString());
        System.out.println(p2.toString());
        System.out.println(p1.distance(p2));
    }
}
