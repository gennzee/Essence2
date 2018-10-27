/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CheckoutDAO;
import DAO.NavigationBarDAO;
import cart.CartBean;
import cart.ProductDTO;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.NavigationBar;
import model.OrderDetail;
import model.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/checkout/")
public class CheckoutController {

    @Autowired
    JavaMailSender mailer1;

    @RequestMapping(value = "checkout")
    public String view(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

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
        return "checkout";
    }

    @RequestMapping(value = "add_orders", method = RequestMethod.GET)
    public String add_orders(ModelMap model, HttpServletRequest request, HttpSession session) {
        int total = Integer.parseInt(request.getParameter("txtTotalPrice"));
        LocalDate now = LocalDate.now();
        String name = request.getParameter("txtName");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        String email = request.getParameter("txtEmail");
        String note = request.getParameter("note");
        int userid = Integer.parseInt(request.getParameter("txtUserID"));

        Orders orders = new Orders(total, now.toString(), name, phone, address, note, userid, 1, 1);
        CheckoutDAO list = new CheckoutDAO();
        list.add_order(orders);

        CartBean cartBean = (CartBean) session.getAttribute("SHOP");
        for (ProductDTO productDTO : cartBean.values()) {
            OrderDetail orderdetail = new OrderDetail(productDTO.getQuantity(), list.select_id_just_added_to_order(), productDTO.getSanpham().getId());
            list.add_orderdetail(orderdetail);
        }

        try {
            // Tạo mail
            MimeMessage mail = mailer1.createMimeMessage();
            // Sử dụng lớp trợ giúp
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            String from = "anhnxps05368@fpt.edu.vn";
            String subject = "Đặt đơn hàng từ Essence Shop";
            String body = "Đơn hàng của bạn đã được đặt thành công ! ";
            helper.setFrom(from, from);
            helper.setTo(email);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(body, true);
            // Gửi mail
            mailer1.send(mail);
        } catch (Exception e) {
            model.addAttribute("message", "Gửi email thất bại !");
            e.printStackTrace();
        }

        return "redirect:" + session.getAttribute("uri").toString();
    }
}
