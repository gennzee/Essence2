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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Catalog;
import model.NavigationBarr;
import model.Products;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/sale/")
public class SaleController {

    @RequestMapping(value = "sale")
    public String sale(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        SaleDAO sale = new SaleDAO();
        List<Products> ds = new ArrayList<Products>();
        ds = sale.showSale();
        
        model.addAttribute("sale_size", ds.size());
        model.addAttribute("listProducts", ds);
        model.addAttribute("sale", "sale");

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
        return "Sale";
    }

}
