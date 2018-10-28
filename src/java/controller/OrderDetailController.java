/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.OrderDetailDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
import model.OrderDetail;
import model.OrderDetailWithId;
import model.ShipperWithOrder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/orderdetail/")
public class OrderDetailController {

    @RequestMapping(value = "{idd}")
    public String view(ModelMap model, HttpServletRequest request, @PathVariable int idd) {
        HttpSession session = request.getSession(false);
        List<OrderDetailWithId> ds = new ArrayList<>();
        OrderDetailDAO orderdetailwithid = new OrderDetailDAO();
        ds = orderdetailwithid.listOrderDetail(idd);

        List<ShipperWithOrder> ds2 = new ArrayList<>();
        ds2 = orderdetailwithid.get_shipper(idd);

        model.addAttribute("list_order_detail_items", ds);
        model.addAttribute("shipper_info", ds2);
        
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
        session.getAttribute("ORDER_LIST");
        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "order_status";
    }

}
