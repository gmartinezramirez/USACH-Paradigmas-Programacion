package paradigmas;

import paradigmas.TDA.Article;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Shopping {
  public static void main(String[] args) {

    // Crear articulos
    Article article1 = new Article("article1", 123.1, 1);
    Article article2 = new Article("article2", 999.9, 1);

    // Crear lista
    List<Article> articles = new ArrayList<>(Arrays.asList(article1, article2));

    // Agregar a lista
    Article article3 = new Article("article3", 1900000.9, 2);
    articles.add(article3);

    // Imprimir lista
    for (Article article : articles) {
      System.out.println(article.toString());
    }

    System.out.println("Hello Shopping list");
  }
}
