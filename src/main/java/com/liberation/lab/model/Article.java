package com.liberation.lab.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="article")
public class Article {
	
	@Id
    @Column(name="articleId")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int articleId;
    
    @Column(name = "articleTypeId")
	private String articleTypeId;
	
    @Column(name = "articleTitle")
	private String articleTitle;
	
    @Column(name = "articleSummary")
	private String articleSummary;
	
    @Column(name = "articleImage")
	private String articleImage;
	
    @Column(name = "articleContent")
	private String articleContent;
	
    @Column(name = "articleCreatorId")
	private int articleCreatorId;
	
    @Column(name = "articlePublicationTime")
	private Timestamp articlePublicationTime;
	
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public String getArticleTypeId() {
		return articleTypeId;
	}
	public void setArticleTypeId(String articleTypeId) {
		this.articleTypeId = articleTypeId;
	}
	public String getArticleTitle() {
		return articleTitle;
	}
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle;
	}
	public String getArticleSummary() {
		return articleSummary;
	}
	public void setArticleSummary(String articleSummary) {
		this.articleSummary = articleSummary;
	}
	public String getArticleImage() {
		return articleImage;
	}
	public void setArticleImage(String articleImage) {
		this.articleImage = articleImage;
	}
	public String getArticleContent() {
		return articleContent;
	}
	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}
	public int getArticleCreatorId() {
		return articleCreatorId;
	}
	public void setArticleCreatorId(int articleCreatorId) {
		this.articleCreatorId = articleCreatorId;
	}
	public Timestamp getArticlePublicationTime() {
		return articlePublicationTime;
	}
	public void setArticlePublicationTime(Timestamp articlePublicationTime) {
		this.articlePublicationTime = articlePublicationTime;
	}
 
    @Override
    public String toString(){
        return "articleId="+articleId+", articleTypeId="+articleTypeId+", articleTitle="+articleTitle
        		+",articleSummary="+articleSummary+", articleContent="+articleContent+", articleCreatorId="
        		+articleCreatorId+", articlePublicationTime="+articlePublicationTime;
    }
 

}
