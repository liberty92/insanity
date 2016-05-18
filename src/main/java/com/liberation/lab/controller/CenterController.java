package com.liberation.lab.controller;

import java.io.IOException;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.liberation.lab.model.Article;
import com.liberation.lab.model.Person;
import com.liberation.lab.service.ArticleService;
import com.liberation.lab.service.ArticleServiceImpl;

@Controller
public class CenterController {
	
	private ArticleService articleService;
	
	@Autowired(required=true)
    @Qualifier(value="articleService")
    public void setArticleService(ArticleService as){
        this.articleService = as;
    }
	
    @RequestMapping(value= "/", method = RequestMethod.GET)
    public String index(Model model){
    	model.addAttribute("listArticles", this.articleService.listArticlesForHomepage());
    	return "index";
    }
    
    
    @RequestMapping(value= "/changeTheme", method = RequestMethod.GET)
    public void changeTheme(ServletRequest request, ServletResponse response) throws IOException{
    	HttpServletRequest req = (HttpServletRequest) request;
    	HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession(true);
		
		int themeCount = 2;
		
		if(session.getAttribute("themeChangingCount") == null){
			session.setAttribute("themeChangingCount", 2);
			themeCount = 1;
		}
		else{
			themeCount = Integer.parseInt(session.getAttribute("themeChangingCount").toString());
			themeCount ++;
			session.setAttribute("themeChangingCount", themeCount);
		}
		String returnTheme = "style2.css"; 
		if(themeCount %2 != 0){
			returnTheme = "style.css";
		}
		session.setAttribute("theme", returnTheme);
		String referrer = req.getHeader("referer");
		res.sendRedirect(referrer);
    }
}
