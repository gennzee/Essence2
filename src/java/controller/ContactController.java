/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ContactDAO;
import DAO.NavigationBarDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Contact;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author tanks
 */
@Controller
@RequestMapping(value = "/contact/")
public class ContactController {

    @RequestMapping(value = "contact")
    public String contact(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        
        List<Contact> ds = new ArrayList<>();
        ContactDAO a = new ContactDAO();
        ds = a.showContact();
        
        model.addAttribute("contact", ds);
        
        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "contact";
    }
    
    

}
