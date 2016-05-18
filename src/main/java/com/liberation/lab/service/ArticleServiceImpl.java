package com.liberation.lab.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.liberation.lab.dao.ArticleDAO;
import com.liberation.lab.model.Article;

public class ArticleServiceImpl implements ArticleService{

    private ArticleDAO articleDAO;
    
    public void setArticleDAO(ArticleDAO articleDAO) {
        this.articleDAO = articleDAO;
    }
 
    @Override
    @Transactional
    public void addArticle(Article a) {
        this.articleDAO.addArticle(a);
    }
 
    @Override
    @Transactional
    public void updateArticle(Article p) {
        this.articleDAO.updateArticle(p);
    }
    
    @Override
    @Transactional
    public List<Article> listArticles() {
    	return this.articleDAO.listArticles();
    }
 
    @Override
    @Transactional
    public List<Article> listArticlesForHomepage() {
        return this.articleDAO.listArticlesForHomepage();
    }
 
    @Override
    @Transactional
    public List<Article> listArticlesByArticleType(String articleType){
        return this.articleDAO.listArticlesByArticleType(articleType);
    }
 
    @Override
    @Transactional
    public List<Article> listArticlesByArticleTitle (String articleTitle){
        return this.articleDAO.listArticlesByArticleTitle(articleTitle);
    }
 
    @Override
    @Transactional
    public Article getArticleById(int id) {
        return this.articleDAO.getArticleById(id);
    }
 
    @Override
    @Transactional
    public void removeArticle(int id) {
        this.articleDAO.removeArticle(id);
    }
}
