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
import model.NavigationBar;
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
        return "Sale";
    }

}
