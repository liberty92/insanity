package com.liberation.lab.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
public class AdminController {
    @RequestMapping(value= "/admin", method = RequestMethod.GET)
    public String index(){
    	return "admin/dashBoard";
    }
}
