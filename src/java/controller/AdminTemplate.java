/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UsersDAO;
import java.util.ArrayList;
import java.util.List;
import model.Users;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/admin/")
public class AdminTemplate {

    @RequestMapping(value = "dashboard")
    public String dashboard() {
        return "admin/dashboard";
    }

    @RequestMapping(value = "form")
    public String form() {
        return "admin/form";
    }

    @RequestMapping(value = "users")
    public String users(ModelMap model) {

        List<Users> ds = new ArrayList<>();
        UsersDAO a = new UsersDAO();
        ds = a.showList_users_admin();

        model.addAttribute("list_users_admin", ds);

        return "admin/users";
    }

    @RequestMapping(value = "nav")
    public String nav(ModelMap model) {

        List<Users> ds = new ArrayList<>();
        UsersDAO a = new UsersDAO();
        ds = a.showList_users_admin();

        model.addAttribute("list_users_admin", ds);

        return "admin/nav_items";
    }
}
