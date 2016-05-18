package com.liberation.lab.service;

import java.util.List;

import com.liberation.lab.model.Article;

public interface ArticleService {

    public void addArticle(Article a);
    public void updateArticle(Article a);
    public List<Article> listArticles();
    public List<Article> listArticlesForHomepage();
    public List<Article> listArticlesByArticleType(String articleType);
    public List<Article> listArticlesByArticleTitle(String articleTitle);
    public Article getArticleById(int id);
    public void removeArticle(int id);
}
