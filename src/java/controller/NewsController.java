/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.NewsDAO;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Catalog;
import model.NavigationBarr;
import model.News;
import model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/news/")
public class NewsController {

    @RequestMapping(value = "news", method = RequestMethod.GET)
    public String view(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        NewsDAO news = new NewsDAO();
        List<News> ds = new ArrayList<>();
        ds = news.showListNews();
        model.addAttribute("listNews", ds);

        session.getAttribute("list_Nav");
        session.getAttribute("list_Catalog");
        session.getAttribute("nav_Size");
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("WISHLIST_SIZE");
        session.getAttribute("WISHLIST_LIST");
        session.getAttribute("ORDER_LIST");
        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "news";
    }

    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    public String news_detail(ModelMap model, HttpServletRequest request, @PathVariable int id) {
        HttpSession session = request.getSession(false);

        NewsDAO news = new NewsDAO();
        List<News> ds = new ArrayList<>();
        ds = news.show_single_news(id);
        model.addAttribute("news_item", ds);

        ds = news.showListNews();
        model.addAttribute("listNews", ds);

        session.getAttribute("list_Nav");
        session.getAttribute("list_Catalog");
        session.getAttribute("nav_Size");
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("WISHLIST_SIZE");
        session.getAttribute("WISHLIST_LIST");
        session.getAttribute("ORDER_LIST");
        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "new_detail";
    }

    @RequestMapping(value = "add_news", method = RequestMethod.POST)
    public String add_news(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String title = request.getParameter("txtTitle");
        String content = request.getParameter("txtContent");
        String createdby = session.getAttribute("USER").toString();
        LocalDate now = LocalDate.now();
        String createddate = now.toString();
        
        News a = new News(title, content, createdby, createddate, "");
        NewsDAO news = new NewsDAO();
        news.add_news(a);
        
        return "admin/form";

    }
}
