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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
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
        ds = productsDetail.findOne_Id_of_Product(products_id);
        String name = ds.get(0).getName();
        String detail = ds.get(0).getDetail();
        int price = ds.get(0).getPrice();
        int discount = ds.get(0).getDiscount();
        int quantity = ds.get(0).getQuantity();
        String brand = ds.get(0).getBrand();
        String img1 = ds.get(0).getImg1();
        String img2 = ds.get(0).getImg2();
        int catalogid = ds.get(0).getCatalogid();
        int supplierid = ds.get(0).getSupplierid();
        Products s = new Products(products_id, name, detail, price, discount, quantity, brand, img1, img2, catalogid, supplierid);
        ProductDTO sanpham = new ProductDTO(s);
        a.addSanPham(sanpham);
        
        session.setAttribute("SHOP", a);
        session.setAttribute("CARTSIZE", a.size());
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("ORDER_LIST");

        return "redirect:"+session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "remove", method = RequestMethod.GET)
    public String remove(HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession(true);
        String rmv = request.getParameter("rmv");
        if (rmv != null) {
            if (session != null) {
                CartBean a = (CartBean) session.getAttribute("SHOP");
                if (a != null) {
                    a.removeSanpham(Integer.parseInt(rmv));
                    session.setAttribute("SHOP", a);
                    session.setAttribute("CARTSIZE", a.size());
                    if(a.size() == 0){
                        session.removeAttribute("SHOP");
                        session.removeAttribute("CARTSIZE");
                    }
                }
            }
        }
        session.getAttribute("IMGUSER");
        session.getAttribute("listUser");
        session.getAttribute("ORDER_LIST");
        return "redirect:"+session.getAttribute("uri").toString();
    }

}
