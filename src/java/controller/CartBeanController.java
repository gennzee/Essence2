/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.ProductDetailDAO;
import DAO.ProductsDAO;
import cart.CartBean;
import cart.ProductDTO;
import com.sun.net.httpserver.HttpServer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Products;
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
@RequestMapping(value = "/cartbean/")
public class CartBeanController {

    @RequestMapping(value = "{products_id}")
    public String viewcart(HttpServletRequest request, ModelMap model, @PathVariable int products_id) {
        HttpSession session = request.getSession(true);
        CartBean a = (CartBean) session.getAttribute("SHOP");
        if (a == null) {
            a = new CartBean();
        }
        ProductDetailDAO productsDetail = new ProductDetailDAO();
        List<Products> ds = new ArrayList<Products>();
        ds = productsDetail.findOne_Id_of_Product(products_id);// need to edit
        String name = ds.get(0).getName();
        String detail = ds.get(0).getDetail();
        int price = ds.get(0).getPrice();
        int discount = ds.get(0).getDiscount();
        String brand = ds.get(0).getBrand();
        String img1 = ds.get(0).getImg1();
        String img2 = ds.get(0).getImg2();
        int catalogid = ds.get(0).getCatalogid();
        Products s = new Products(products_id, name, detail, price, discount, brand, img1, img2, catalogid);
        ProductDTO sanpham = new ProductDTO(s);
        a.addSanPham(sanpham);

        session.setAttribute("SHOP", a);
        session.setAttribute("CARTSIZE", a.countQuantity());
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("ORDER_LIST");

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "viewcart")
    public String viewcart(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        session.getAttribute("SHOP");
        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("ORDER_LIST");
        session.setAttribute("uriii", request.getRequestURI().substring(request.getContextPath().length()));
        return "viewcart";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String remove(HttpServletRequest request, ModelMap model, @PathVariable int id) {
        HttpSession session = request.getSession(true);
            CartBean a = (CartBean) session.getAttribute("SHOP");
            if (a != null) {
                
                a.removeSanpham(id);
                session.setAttribute("SHOP", a);
                session.setAttribute("CARTSIZE", a.countQuantity());
                if (a.size() == 0) {
                    session.removeAttribute("SHOP");
                    session.removeAttribute("CARTSIZE");
                }
                
            }
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("ORDER_LIST");
        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String update(HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession(true);
        CartBean a = (CartBean) session.getAttribute("SHOP");
        if (a != null) {

            String[] idd = request.getParameterValues("txtId");
            String[] quantityy = request.getParameterValues("txtQuantity");
            for (int i = 0; i < idd.length; i++) {
                String id = idd[i];
                String quantity = quantityy[i];
                a.updateQuantity(Integer.parseInt(id), Integer.parseInt(quantity));

            }
            
            session.setAttribute("SHOP", a);
            session.setAttribute("CARTSIZE", a.countQuantity());
        }
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("ORDER_LIST");
        return "redirect:" + session.getAttribute("uriii").toString();
    }
    
    @RequestMapping(value = "continue_shopping")
    public String continue_shopping(HttpServletRequest request){
        HttpSession session = request.getSession(false);
        
        return "redirect:" + session.getAttribute("uri").toString();
    }

}
