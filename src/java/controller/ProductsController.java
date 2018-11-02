/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.ProductsDAO;
import DAO.SaleDAO;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Catalog;
import model.NavigationBarr;
import model.Products;
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
@RequestMapping(value = "/products/")
public class ProductsController {

    @RequestMapping("productsIndex")
    public String productsIndex(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        ProductsDAO products = new ProductsDAO();
        List<Products> ds = new ArrayList<Products>();
        ds = products.showProducts();
        model.addAttribute("listProducts", ds);

        NavigationBarDAO navigation = new NavigationBarDAO();
        List<Catalog> catalog = new ArrayList<>();
        List<NavigationBarr> nav = new ArrayList<>();
        catalog = navigation.showCatalog();
        nav = navigation.showNav();
        session.setAttribute("list_Nav", nav);
        session.setAttribute("list_Catalog", catalog);
        session.setAttribute("nav_Size", nav.size());
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("WISHLIST_SIZE");
        session.getAttribute("WISHLIST_LIST");
        session.getAttribute("ORDER_LIST");
        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "index";
    }

    @RequestMapping("search")
    public String search(ModelMap model, HttpServletRequest request) {
        String txtSearch = request.getParameter("txtSearch");
        HttpSession session = request.getSession(false);
        ProductsDAO products = new ProductsDAO();
        List<Products> ds = new ArrayList<Products>();
        ds = products.Search(txtSearch);
        model.addAttribute("search_size", ds.size());
        model.addAttribute("listProducts", ds);
        model.addAttribute("shop_title_search_result", "search result");

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
        return "shop";
    }

    @RequestMapping("{menu2id}")
    public String menu2id(ModelMap model, HttpServletRequest request, @PathVariable int menu2id) {
        HttpSession session = request.getSession(false);

        if (session.getAttribute("ROLE").toString().equalsIgnoreCase("admin")) {

            ProductsDAO products = new ProductsDAO();
            List<Products> ds = new ArrayList<Products>();
            ds = products.showProducts_select(menu2id);
            List<Catalog> ds2 = new ArrayList<Catalog>();
            ds2 = products.shop_title(menu2id);

            model.addAttribute("shop_title", ds2);
            model.addAttribute("listProducts", ds);
            model.addAttribute("product_size", ds.size());
            
            session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
            return "admin/products";
        } else {
            ProductsDAO products = new ProductsDAO();
            List<Products> ds = new ArrayList<Products>();
            ds = products.showProducts_select(menu2id);
            List<Catalog> ds2 = new ArrayList<Catalog>();
            ds2 = products.shop_title(menu2id);

            model.addAttribute("shop_title", ds2);
            model.addAttribute("shopIndex_size", ds.size());
            model.addAttribute("listProducts", ds);

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
            return "shop";
        }
    }

}
