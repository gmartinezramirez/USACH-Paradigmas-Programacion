package paradigmas.Service.Impl;

import paradigmas.Service.IShoppingListValidationService;
import paradigmas.Service.IShoppingListService;
import paradigmas.TDA.Article;

import java.util.List;

public class ShoppingListService implements IShoppingListService, IShoppingListValidationService {

  /**
   * @param articles esto es una lista de articulos
   * @param aName el nombre del articulo a buscar
   * @return articulo cuyo nombre corresponda con aName
   */
  @Override
  public Article getArticleByName(List<Article> articles, String aName) throws Exception {
    if (isAValidShoppingList(articles)) {
      for (Article item : articles) {
        if (item.getName().equals(aName)) {
          return item;
        }
      }
    }
    throw new Exception("Shopping list not valid");
  }

  public double getTotalCost(List<Article> articles) throws Exception {
    if (isAValidShoppingList(articles)) {
      double accum = 0.0;
      for (Article article : articles) {
        accum = article.getPrice() + accum;
      }
      return accum;
    }
    throw new Exception("Shopping list not valid");
  }

  public boolean isAValidShoppingList(List<Article> articles) {
    return articles != null || !articles.isEmpty();
  }
}
