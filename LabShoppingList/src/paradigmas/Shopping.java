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
    printListOfArticles(articles);

    // Remover objeto basado en su indice en la lista
    int index = 0;
    articles.remove(index);
    printListOfArticles(articles);

    // Remover objeto de la lista pasandole un objeto
    articles.remove(article3);
    printListOfArticles(articles);

    String articleName = "article2";
    Article foundArticle = getArticleByName(articles, articleName);
    System.out.println("Articulo encontrado en la lista: ");
    System.out.println(foundArticle.toString());

    Article notFoundArticle = getArticleByName(articles, "hola");
    System.out.println("Articulo encontrado en la lista: ");
    if (notFoundArticle != null) {
      System.out.println(notFoundArticle.toString());
    }
  }

  private static Article getArticleByName(List<Article> aListOfArticles, String aName) {
    for (Article item : aListOfArticles) {
      if (item.getName().equals(aName)) {
        return item;
      }
    }
    return null;
  }

  private static void printListOfArticles(List<Article> articles) {
    System.out.println("Lista");
    for (Article article : articles) {
      System.out.println(article.toString());
    }
  }
}
