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

    @RequestMapping(value = "users", method = RequestMethod.GET)
    @ResponseBody
    public String users() {
        //tesst validation
        UsersDAO a = new UsersDAO();
        Boolean b = a.showUsers_validation("chuacothongtin") == true;
        return b.toString();
    }
}
