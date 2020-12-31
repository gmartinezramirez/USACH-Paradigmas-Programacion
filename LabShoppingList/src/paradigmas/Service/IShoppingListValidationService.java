package paradigmas.Service;

import paradigmas.TDA.Article;

import java.util.List;

public interface IShoppingListValidationService {

    boolean isAValidShoppingList(List<Article> articles);

}
