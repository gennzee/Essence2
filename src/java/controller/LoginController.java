/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.OrderDAO;
import DAO.UsersDAO;
import DAO.WishlistDAO;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Orders;
import model.Users;
import model.Wishlist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import service.RandomString;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/login/")
public class LoginController {

    @Autowired
    JavaMailSender mailer1;

    @RequestMapping(value = "loginIndex", method = RequestMethod.POST)
    public String loginIndex(ModelMap model, HttpServletRequest request, HttpSession session) {
        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPass");
        UsersDAO users = new UsersDAO();
        if (users.Login(username, password) == "nhanvien" || users.Login(username, password) == "guest") {
            session.setAttribute("USER", username);
            session.setAttribute("PASS", password);
            session.setAttribute("ROLE", users.Login(username, password));

            List<Users> ds2 = new ArrayList<Users>();
            ds2 = users.showUsers(username);

            Wishlist a = new Wishlist();
            WishlistDAO wishlist = new WishlistDAO();
            List<Wishlist> ds3 = new ArrayList<>();
            ds3 = wishlist.showWishlist(ds2.get(0).getId());

            session.setAttribute("IMGUSER", ds2.get(0).getImageuser());
            session.setAttribute("listUser", ds2);
            session.setAttribute("WISHLIST_SIZE", ds3.size());
            session.setAttribute("WISHLIST_LIST", ds3);

            int userid = Integer.parseInt(ds2.get(0).getId());
            session.setAttribute("USER_ID", userid);

            session.getAttribute("CARTSIZE");

            // List order of user - start
            List<Orders> order = new ArrayList<>();
            OrderDAO orderdao = new OrderDAO();
            order = orderdao.listOrders(session.getAttribute("USER_ID").toString());
            session.setAttribute("ORDER_LIST", order);
            // List order of user - end

            return "redirect:" + session.getAttribute("uri").toString();
        } else if (users.Login(username, password) == "admin") {
            session.setAttribute("USER", username);
            session.setAttribute("PASS", password);
            session.setAttribute("ROLE", users.Login(username, password));

            List<Users> ds2 = new ArrayList<Users>();
            ds2 = users.showUsers(username);

            session.setAttribute("NAME", ds2.get(0).getName());
            session.setAttribute("IMGUSER", ds2.get(0).getImageuser());
            session.setAttribute("ID", ds2.get(0).getId());
            session.setAttribute("ROLE_ID", ds2.get(0).getRoleid());
            
            session.setAttribute("user_items", ds2);

            return "admin/dashboard";
        } else {
            session.getAttribute("CARTSIZE");
            model.addAttribute("login_error", "Sai tên tài khoản hoặc mật khẩu.");
            return "redirect:" + session.getAttribute("uri").toString();
        }
    }

    @RequestMapping("logout")
    public String logout(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session.getAttribute("ROLE") != null && session.getAttribute("ROLE").toString().equalsIgnoreCase("admin")) {
            session.getAttribute("CARTSIZE");

            session.removeAttribute("USER");
            session.removeAttribute("PASS");
            session.removeAttribute("ROLE");
            session.removeAttribute("IMGUSER");
            session.removeAttribute("WISHLIST_SIZE");
            session.removeAttribute("WISHLIST_LIST");
            session.removeAttribute("ORDER_LIST");
            return "redirect:/products/productsIndex.htm";
        } else {
            session.getAttribute("CARTSIZE");

            session.removeAttribute("USER");
            session.removeAttribute("PASS");
            session.removeAttribute("ROLE");
            session.removeAttribute("IMGUSER");
            session.removeAttribute("WISHLIST_SIZE");
            session.removeAttribute("WISHLIST_LIST");
            session.removeAttribute("ORDER_LIST");

            return "redirect:" + session.getAttribute("uri").toString();
        }

    }

    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession(false);
        String username = request.getParameter("txtUser");
        String password = request.getParameter("txtPass");
        String name = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String image = request.getParameter("txtImage");
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        LocalDate now = LocalDate.now();
        Users a = new Users(username, password, name, email, image, phone, address, now.toString());
        UsersDAO user = new UsersDAO();
        user.Insert(a);

        model.addAttribute("mess", "Thêm thành công");

        session.getAttribute("CARTSIZE");
        session.getAttribute("IMGUSER");
        session.getAttribute("ORDER_LIST");

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "fogetpass", method = RequestMethod.GET)
    public String fogetpass(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        try {
            String username = request.getParameter("txtUser");
            String email = request.getParameter("txtEmail");
            String new_password = RandomString.getRandomString(4, 7);
            UsersDAO a = new UsersDAO();
            if (a.isExitEmail(username, email)) {
                a.getPassword(new_password, username);
                // Tạo mail
                MimeMessage mail = mailer1.createMimeMessage();
                // Sử dụng lớp trợ giúp
                MimeMessageHelper helper = new MimeMessageHelper(mail);
                String from = "anhnxps05368@fpt.edu.vn";
                String subject = "Quên mật khẩu";
                String body = "Mật khẩu mới của bạn là: " + new_password;
                helper.setFrom(from, from);
                helper.setTo(email);
                helper.setReplyTo(from, from);
                helper.setSubject(subject);
                helper.setText(body, true);
                // Gửi mail
                mailer1.send(mail);
                model.addAttribute("message", "Gửi email thành công !");
            } else {
                model.addAttribute("message", "Email không tồn tại !");
            }
        } catch (Exception ex) {
            model.addAttribute("message", "Gửi email thất bại !");
        }
        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession(false);
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String email = request.getParameter("txtEmail");
        String image = request.getParameter("txtImage");
        if (request.getParameter("txtImage").toString().equalsIgnoreCase("")) {
            image = session.getAttribute("IMGUSER").toString();
        }
        String phone = request.getParameter("txtPhone");
        String address = request.getParameter("txtAddress");
        Users a = new Users(id, name, email, image, phone, address);
        UsersDAO user = new UsersDAO();
        user.Update(a);

        model.addAttribute("mess", "Sửa thành công");

        List<Users> ds2 = new ArrayList<Users>();
        ds2 = user.showUsers(session.getAttribute("USER").toString());

        session.getAttribute("CARTSIZE");

        session.setAttribute("listUser", ds2);
        session.setAttribute("IMGUSER", image);
        session.getAttribute("ORDER_LIST");

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "changepass", method = RequestMethod.POST)
    public String change(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String username = request.getParameter("txtUser");
        String oldpassword = request.getParameter("txtPass");
        String newpassword = request.getParameter("txtNewPass");
        if (oldpassword.equalsIgnoreCase(session.getAttribute("PASS").toString())) {
            UsersDAO user = new UsersDAO();
            if (user.UpdatePass(username, newpassword)) {
                return "redirect:" + session.getAttribute("uri").toString();
            }
        }
        return "redirect:" + session.getAttribute("uri").toString();
    }

}
