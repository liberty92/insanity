package com.liberation.lab.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liberation.lab.model.Article;
import com.liberation.lab.service.ArticleService;

@Controller
public class ArticleController {

    private ArticleService articleService;
    
    @Autowired(required=true)
    @Qualifier(value="articleService")
    public void setArticleService(ArticleService as){
        this.articleService = as;
    }
    
    
    @RequestMapping(value= "/listArticle/{articleType}", method = RequestMethod.GET)
    public String listArticlesByArticleType(@PathVariable("articleType") String articleType,Model model){
    	model.addAttribute("listArticles", this.articleService.listArticlesByArticleType(articleType));
    	model.addAttribute("articleTypeHeader",articleType);
    	return "article/listArticle";
    }
    
    
    @RequestMapping(value= "/admin/listArticle/{articleType}", method = RequestMethod.GET)
    public String adminListArticlesByArticleType(@PathVariable("articleType") String articleType,Model model){
    	model.addAttribute("listArticles", this.articleService.listArticlesByArticleType(articleType));
    	model.addAttribute("articleTypeHeader",articleType);
    	return "admin/listArticle";
    }
    
    
    @RequestMapping(value= "/searchArticle", method = RequestMethod.POST)
    public String searchArticle(HttpServletRequest request,Model model){
     	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     	String articleTitle = request.getParameter("articleTitle");
    	model.addAttribute("listArticles", this.articleService.listArticlesByArticleTitle(articleTitle));
    	model.addAttribute("keyword", articleTitle);
    	return "article/searchArticle";
    }
    
    
    @RequestMapping(value= "/admin/searchArticle", method = RequestMethod.POST)
    public String adminSearchArticle(HttpServletRequest request,Model model){
     	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
     	String articleTitle = request.getParameter("articleTitle");
    	model.addAttribute("listArticles", this.articleService.listArticlesByArticleTitle(articleTitle));
    	model.addAttribute("keyword", articleTitle);
    	return "admin/listArticle";
    }
    
     
    @RequestMapping("/admin/removeArticle/{articleId}")
    public String adminRemoveArticle(@PathVariable("articleId") int id){
         
        this.articleService.removeArticle(id);
        return "redirect:/admin/article";
    }
     
     
    @RequestMapping(value = {"/core/article"}, method = RequestMethod.GET)
    public String listArticles(Model model) {
        model.addAttribute("article", new Article());
        model.addAttribute("listArticles", this.articleService.listArticles());
        return "core/coreArticle";
    }
    
    
    @RequestMapping("/viewArticle/{articleId}")
    public String viewArticle(@PathVariable("articleId") int id, Model model){
        String articleTypeHeader = this.articleService.getArticleById(id).getArticleTypeId();
        model.addAttribute("articleTypeHeader",articleTypeHeader);
        model.addAttribute("article", this.articleService.getArticleById(id));
        return "/article/viewArticle";
    }
     
    @RequestMapping(value= "/core/addArticle", method = RequestMethod.POST)
    public String addArticle(Model model, HttpServletRequest request, HttpServletResponse response){
    	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	int articleId = 0;
    	if(request.getParameter("articleId") != null){
    		articleId = Integer.parseInt(request.getParameter("articleId"));
    	}
    	
    	String articleTypeId = request.getParameter("articleTypeId");
    	String articleTitle = request.getParameter("articleTitle");
    	String articleSummary = request.getParameter("articleSummary");
    	String articleContent = request.getParameter("articleContent");
    	int articleCreatorId = 0;
    	
    	if(request.getParameter("articleCreatorId") != null){
    		articleCreatorId = Integer.parseInt(request.getParameter("articleCreatorId"));
    	}
    	String articleImage = request.getParameter("articleImage");
    	
    	Timestamp articlePublicationTime;
    	java.util.Date date= new java.util.Date();
    	articlePublicationTime = new Timestamp(date.getTime());
    	String articlePublicationTimeParam = request.getParameter("articlePublicationTime").replaceAll("/", "-");
    	if(articlePublicationTimeParam != null){

    		System.out.println(articlePublicationTimeParam.length());

    		String oldFormat = "dd-MM-yyyy HH:mm:ss";
    	    String newFormat = "yyyy-MM-dd HH:mm:ss";

    	    SimpleDateFormat sdf1 = new SimpleDateFormat(oldFormat);
    	    SimpleDateFormat sdf2 = new SimpleDateFormat(newFormat);


    	    try {
    	    	Timestamp timestamp = Timestamp.valueOf(sdf2.format(sdf1.parse(articlePublicationTimeParam)));
    	    	articlePublicationTime = timestamp;

    	    } catch (ParseException e) {
    	        // TODO Auto-generated catch block
    	        e.printStackTrace();
    	    }
    	}
    	
    	
        Article a = new Article();
        a.setArticleId(articleId);
        a.setArticleTypeId(articleTypeId);
        a.setArticleTitle(articleTitle);
        a.setArticleSummary(articleSummary);
        a.setArticleContent(articleContent);
        a.setArticleCreatorId(articleCreatorId);
        a.setArticleImage(articleImage);
        a.setArticlePublicationTime(articlePublicationTime);
        
 
    	
        if(a.getArticleId() == 0){
            //new article, add it
            this.articleService.addArticle(a);
        }else{
            //existing article, call update
            this.articleService.updateArticle(a);
        }
         
        return "redirect:/core/article";
         
    }
    
     
    @RequestMapping("/core/removeArticle/{articleId}")
    public String removeArticle(@PathVariable("articleId") int id){
         
        this.articleService.removeArticle(id);
        return "redirect:/core/article";
    }
    
    @RequestMapping("/core/editArticle/{articleId}")
    public String editArticle(@PathVariable("articleId") int id, Model model){
        model.addAttribute("article", this.articleService.getArticleById(id));
        model.addAttribute("listArticles", this.articleService.listArticles());
        return "/core/coreArticle";
    }
    
    

    @RequestMapping(value= "/admin/addArticle", method = RequestMethod.POST)
    public String adminAddArticle(Model model, HttpServletRequest request, HttpServletResponse response){
    	try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);

		int userId = 0;
		if (session.getAttribute("userId") != null) {
			userId = Integer.parseInt(session.getAttribute("userId").toString());
		}
    	
    	int articleId = 0;
    	if(request.getParameter("articleId") != null){
    		if(request.getParameter("articleId").toString().length()>0){
    		articleId = Integer.parseInt(request.getParameter("articleId"));
    		}
    	}
    	
    	String articleTypeId = request.getParameter("articleTypeId");
    	String articleTitle = request.getParameter("articleTitle");
    	String articleSummary = request.getParameter("articleSummary");
    	String articleContent = request.getParameter("articleContent");
    	
    	int articleCreatorId = userId;
    	
   
    	String articleImage = request.getParameter("articleImage");
    	
    	Timestamp articlePublicationTime;
    	java.util.Date date= new java.util.Date();
    	articlePublicationTime = new Timestamp(date.getTime());
    	String articlePublicationTimeParam = request.getParameter("articlePublicationTime").replaceAll("/", "-");
    	if(articlePublicationTimeParam != null){

    		System.out.println(articlePublicationTimeParam.length());

    		String oldFormat = "dd-MM-yyyy HH:mm:ss";
    	    String newFormat = "yyyy-MM-dd HH:mm:ss";

    	    SimpleDateFormat sdf1 = new SimpleDateFormat(oldFormat);
    	    SimpleDateFormat sdf2 = new SimpleDateFormat(newFormat);


    	    try {
    	    	Timestamp timestamp = Timestamp.valueOf(sdf2.format(sdf1.parse(articlePublicationTimeParam)));
    	    	articlePublicationTime = timestamp;

    	    } catch (ParseException e) {
    	        // TODO Auto-generated catch block
    	        e.printStackTrace();
    	    }
    	}
    	
    	
        Article a = new Article();
        a.setArticleId(articleId);
        a.setArticleTypeId(articleTypeId);
        a.setArticleTitle(articleTitle);
        a.setArticleSummary(articleSummary);
        a.setArticleContent(articleContent);
        a.setArticleCreatorId(articleCreatorId);
        a.setArticleImage(articleImage);
        a.setArticlePublicationTime(articlePublicationTime);
        
 
    	
        if(a.getArticleId() == 0){
            //new article, add it
            this.articleService.addArticle(a);
        }else{
            //existing article, call update
            this.articleService.updateArticle(a);
        }
         
        String returnUrl = "redirect:/admin/listArticle/"+articleTypeId;
        return returnUrl;
    }
    
    @RequestMapping("/admin/addArticleForm")
    public String adminAddArticleForm(){ 
        return "/admin/editArticle";
    }
     
    
    @RequestMapping("/admin/editArticle/{articleId}")
    public String adminEditArticle(@PathVariable("articleId") int id, Model model){
        model.addAttribute("article", this.articleService.getArticleById(id));
        model.addAttribute("listArticles", this.articleService.listArticles());
        return "/admin/editArticle";
    }
     
}
