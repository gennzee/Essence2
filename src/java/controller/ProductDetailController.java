/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.ProductDetailDAO;
import DAO.ProductsDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
import model.Products;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/product_detail/")
public class ProductDetailController {

    @RequestMapping("{products_id}")
    public String products_id(ModelMap model, HttpServletRequest request, @PathVariable int products_id) {
        HttpSession session = request.getSession(false);
        ProductDetailDAO productsDetail = new ProductDetailDAO();
        List<Products> ds = new ArrayList<Products>();
        ds = productsDetail.findOne_Id_of_Product(products_id);
        model.addAttribute("listProducts", ds);

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
        return "shop_detail";
    }
}
