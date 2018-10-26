/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.WishlistDAO;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import model.Wishlist;
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
@RequestMapping(value = "/wishlist/")
public class WishlistController {

    @RequestMapping(value = "{product_id}")
    public String add_wishlist(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int product_id) {
        session = request.getSession(false);

        WishlistDAO list = new WishlistDAO();
        Integer userid = (Integer) session.getAttribute("USER_ID");
        list.Insert(userid, product_id);

        WishlistDAO wishlist = new WishlistDAO();
        List<Wishlist> ds3 = new ArrayList<Wishlist>();
        ds3 = wishlist.showWishlist(session.getAttribute("USER_ID").toString());
        session.setAttribute("WISHLIST_SIZE", ds3.size());
        session.setAttribute("WISHLIST_LIST", ds3);

        return "redirect:" + session.getAttribute("uri").toString();
    }

}
