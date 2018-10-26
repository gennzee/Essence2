/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.NewsDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
import model.News;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    public String news(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        NewsDAO news = new NewsDAO();
        List<News> ds = new ArrayList<>();
        ds = news.showListNews();
        model.addAttribute("listNews", ds);
        
        
        NavigationBarDAO navigation = new NavigationBarDAO();
        List<NavigationBar> thuonghieu = new ArrayList<NavigationBar>();
        thuonghieu = navigation.showNav("1");
        List<NavigationBar> linhkien = new ArrayList<NavigationBar>();
        linhkien = navigation.showNav("2");
        List<NavigationBar> gioitinh = new ArrayList<NavigationBar>();
        gioitinh = navigation.showNav("3");
        model.addAttribute("listNav_thuonghieu", thuonghieu);
        model.addAttribute("listNav_linhkien", linhkien);
        model.addAttribute("listNav_gioitinh", gioitinh);
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
                session.getAttribute("WISHLIST_SIZE");
        session.getAttribute("WISHLIST_LIST");
        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "news";
    }
}
