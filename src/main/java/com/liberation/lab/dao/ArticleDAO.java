package com.liberation.lab.dao;

import java.util.List;

import com.liberation.lab.model.Article;

public interface ArticleDAO {

    public void addArticle(Article a);
    public void updateArticle(Article a);
    public List<Article> listArticles();
    public List<Article> listArticlesByArticleType(String articleType);
    public List<Article> listArticlesByArticleTitle(String articleTitle);
    public List<Article> listArticlesForHomepage();
    public Article getArticleById(int id);
    public void removeArticle(int id);
}
