package paradigmas.Service;

import paradigmas.TDA.Article;

import java.util.List;

public interface IShoppingListService {

    Article getArticleByName(List<Article> articles, String aName) throws Exception;

    double getTotalCost(List<Article> articles) throws Exception;

}
