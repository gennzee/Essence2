/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import DAO.UsersDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.Response;
import model.Users;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/validation/")
public class Validation {

    @RequestMapping(value = "users", method = RequestMethod.POST)
    public @ResponseBody
    String users(HttpServletRequest request, @RequestBody String username) {
        //tesst validation
        UsersDAO a = new UsersDAO();
        Boolean b = false;
        b = a.showUsers_validation(username);
        return b.toString();
    }

    @RequestMapping(value = "emails", method = RequestMethod.POST)
    public @ResponseBody
    String emails(HttpServletRequest request, @RequestBody String email) {
        //tesst validation
        UsersDAO a = new UsersDAO();
        Boolean b = false;
        b = a.showEmails_validation(email);
        return b.toString();
    }

    @RequestMapping(value = "staffs", method = RequestMethod.POST)
    public @ResponseBody
    String staffs(HttpServletRequest request, @RequestBody String username) {
        //tesst validation
        UsersDAO a = new UsersDAO();
        Boolean b = false;
        b = a.showUsers_validation(username);
        return b.toString();
    }

    @RequestMapping(value = "products", method = RequestMethod.POST)
    public @ResponseBody
    String products(HttpServletRequest request, @RequestBody String product_name) {
        //tesst validation
        UsersDAO a = new UsersDAO();
        Boolean b = false;
        b = a.showProducts_validation(product_name);
        return b.toString();
    }
}
