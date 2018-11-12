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
import model.Catalog;
import model.NavigationBarr;
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
        
        if (session.getAttribute("ROLE") == null) {
            List<OrderDetailWithId> ds = new ArrayList<>();
            OrderDetailDAO orderdetailwithid = new OrderDetailDAO();
            ds = orderdetailwithid.listOrderDetail(idd);

            List<ShipperWithOrder> ds2 = new ArrayList<>();
            ds2 = orderdetailwithid.get_shipper(idd);

            model.addAttribute("list_order_detail_items", ds);
            model.addAttribute("shipper_info", ds2);

            session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
            return "redirect:/products/productsIndex.htm";
        } else {
            List<OrderDetailWithId> ds = new ArrayList<>();
            OrderDetailDAO orderdetailwithid = new OrderDetailDAO();
            ds = orderdetailwithid.listOrderDetail(idd);

            List<ShipperWithOrder> ds2 = new ArrayList<>();
            ds2 = orderdetailwithid.get_shipper(idd);

            model.addAttribute("list_order_detail_items", ds);
            model.addAttribute("shipper_info", ds2);

            session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
            return "order_status";
        }

    }

}
