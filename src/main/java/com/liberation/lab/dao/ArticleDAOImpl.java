package com.liberation.lab.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.liberation.lab.model.Article;

public class ArticleDAOImpl implements ArticleDAO {

    private static final Logger logger = LoggerFactory.getLogger(ArticleDAOImpl.class);
    
    private SessionFactory sessionFactory;
     
    public void setSessionFactory(SessionFactory sf){
        this.sessionFactory = sf;
    }
 
    @Override
    public void addArticle(Article a) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(a);
        logger.info("Article saved successfully, Article Details="+a);
    }
 
    @Override
    public void updateArticle(Article a) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(a);
        logger.info("Article updated successfully, Article Details="+a);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Article> listArticles() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Article> articlesList = session.createQuery("from Article order by articlePublicationTime desc").list();
        for(Article a : articlesList){
            logger.info("Article List::"+a);
        }
        return articlesList;
    }
    
    @Override
    public List<Article> listArticlesByArticleType(String articleType) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Article> listArticlesByArticleType = session.createQuery("from Article where articleTypeId like :articleType order by articlePublicationTime desc").setParameter("articleType", articleType+"%").list();
        for(Article a : listArticlesByArticleType){
            logger.info("UserRole List::"+a);
        }
        return listArticlesByArticleType;
    }
    
    @Override
    public List<Article> listArticlesByArticleTitle(String articleTitle) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Article> listArticlesByArticleTitle = session.createQuery("from Article where articleTitle like :articleTitle order by articlePublicationTime desc").setParameter("articleTitle", "%"+articleTitle+"%").list();
        for(Article a : listArticlesByArticleTitle){
            logger.info("UserRole List::"+a);
        }
        return listArticlesByArticleTitle;
    }
    
    @Override
    public List<Article> listArticlesForHomepage() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Article> articlesListNews = session.createQuery("from Article where articleTypeId like :articleType order by articlePublicationTime desc").setParameter("articleType", "news%").setMaxResults(3).list();
        List<Article> articlesListMarket = session.createQuery("from Article where articleTypeId like :articleType order by articlePublicationTime desc").setParameter("articleType", "market%").setMaxResults(3).list();
        List<Article> articlesListAnnouncement = session.createQuery("from Article where articleTypeId like :articleType order by articlePublicationTime desc").setParameter("articleType", "announcement%").setMaxResults(3).list();
        
        List<Article> newList = new ArrayList<Article>();
        newList.addAll(articlesListNews);
        newList.addAll(articlesListMarket);
        newList.addAll(articlesListAnnouncement);
        
        return newList;
    }
 
    @Override
    public Article getArticleById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        Article a = (Article) session.get(Article.class, new Integer(id));
        logger.info("Article loaded successfully, Article details="+a);
        return a;
    }
 
    @Override
    public void removeArticle(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Article a = (Article) session.load(Article.class, new Integer(id));
        if(null != a){
            session.delete(a);
        }
        logger.info("Article deleted successfully, person details="+a);
    }
}
