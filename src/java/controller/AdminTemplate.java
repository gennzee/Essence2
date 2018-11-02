/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.NavigationBarDAO;
import DAO.NewsDAO;
import DAO.ProductDetailDAO;
import DAO.ProductsDAO;
import DAO.UsersDAO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Catalog;
import model.NavigationBarr;
import model.News;
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

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "nav")
    public String nav(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        NavigationBarDAO navigation = new NavigationBarDAO();
        List<Catalog> catalog = new ArrayList<>();
        List<NavigationBarr> nav = new ArrayList<>();
        catalog = navigation.showCatalog();
        nav = navigation.showNav();

        session.setAttribute("list_Nav", nav);
        session.setAttribute("list_Catalog", catalog);
        session.setAttribute("nav_Size", nav.size());

        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/nav_items";
    }

    @RequestMapping(value = "new_category", method = RequestMethod.POST)
    public String new_category(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtCategory");

        NavigationBarDAO a = new NavigationBarDAO();
        a.InsertNav(name);

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "new_catalog", method = RequestMethod.POST)
    public String new_catalog(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtSubcategory");
        String navid = request.getParameter("txtNavid");

        NavigationBarDAO a = new NavigationBarDAO();
        a.InsertCatalog(name, Integer.parseInt(navid));

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "edit_category", method = RequestMethod.POST)
    public String edit_category(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtCategory");
        String id = request.getParameter("txtCategoryid");

        NavigationBarDAO a = new NavigationBarDAO();
        a.UpdateNav(name, Integer.parseInt(id));

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "edit_catalog", method = RequestMethod.POST)
    public String edit_catalog(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtSubcategory");
        String id = request.getParameter("txtSubcategoryid");

        NavigationBarDAO a = new NavigationBarDAO();
        a.UpdateCatalog(name, Integer.parseInt(id));

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "remove_category/{id}")
    public String remove_category(ModelMap model, HttpSession session, HttpServletRequest request, @PathVariable int id) {
        session = request.getSession(false);

        NavigationBarDAO a = new NavigationBarDAO();
        a.DeleteNav(id);

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "remove_catalog/{id}")
    public String remove_catalog(ModelMap model, HttpSession session, HttpServletRequest request, @PathVariable int id) {
        session = request.getSession(false);

        NavigationBarDAO a = new NavigationBarDAO();
        a.DeleteCatalog(id);

        return "redirect:" + session.getAttribute("uri").toString();
    }

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "users")
    public String users(ModelMap model, HttpSession session, HttpServletRequest request) {

        List<Users> ds = new ArrayList<>();
        UsersDAO a = new UsersDAO();
        ds = a.showList_users_admin();

        model.addAttribute("list_users_admin", ds);
        model.addAttribute("list_users_admin_size", ds.size());

        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/user";
    }

    @RequestMapping(value = "edit_user")
    public String edit_user(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String role = request.getParameter("txtRole");
        String email = request.getParameter("txtEmail");
        String pass = request.getParameter("txtPass");
        String address = request.getParameter("txtAddress");
        String image = request.getParameter("txtImage");
        String phone = request.getParameter("txtPhone");
        String username = request.getParameter("txtUsername");

        if (image.equalsIgnoreCase("") || pass.equalsIgnoreCase("")) {
            UsersDAO user = new UsersDAO();
            if (image.equalsIgnoreCase("") && pass.equalsIgnoreCase("")) {
                Users a = new Users(username, name, email, Integer.parseInt(role), phone, address);

                user.Update_user_with_password_and_image_is_null(a, id);
            } else if (image.equalsIgnoreCase("")) {
                Users a = new Users(username, pass, name, email, Integer.parseInt(role), phone, address);

                user.Update_user_with_image_is_null(a, id);
            } else if (pass.equalsIgnoreCase("")) {
                Users a = new Users(username, name, email, Integer.parseInt(role), image, phone, address);

                user.Update_user_with_password_is_null(a, id);
            }
        } else {
            UsersDAO user = new UsersDAO();
            Users a = new Users(username, pass, name, email, Integer.parseInt(role), image, phone, address);

            user.Update_user_with_password_and_image_is_not_null(a, id);
        }

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "remove_user/{id}")
    public String edit_user(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        if (id > 0) {
            UsersDAO user = new UsersDAO();
            user.Delete(id);
        }

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "add_user", method = RequestMethod.POST)
    public String register(HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession(false);

        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        String role = request.getParameter("txtRole");
        String email = request.getParameter("txtEmail");
        String pass = request.getParameter("txtPass");
        String address = request.getParameter("txtAddress");
        String image = request.getParameter("txtImage");
        String phone = request.getParameter("txtPhone");
        String username = request.getParameter("txtUsername");
        LocalDate now = LocalDate.now();

        Users a = new Users(username, pass, name, email, Integer.parseInt(role), image, phone, address, now.toString());
        UsersDAO user = new UsersDAO();
        user.Insert_with_admin_page(a);

        return "redirect:" + session.getAttribute("uri").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "news")
    public String news(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        NewsDAO news = new NewsDAO();
        List<News> ds = new ArrayList<>();
        ds = news.showListNews();
        model.addAttribute("listNews", ds);
        model.addAttribute("listNews_size", ds.size());

        session.setAttribute("uri", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/news";
    }

    @RequestMapping(value = "news_add")
    public String news_add(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        return "admin/news_add";
    }

    @RequestMapping(value = "news_edit")
    public String news_edit(ModelMap model, HttpServletRequest request){
        HttpSession session = request.getSession(false);

        String id = request.getParameter("txtId");
        String title = request.getParameter("txtTitle");
        String imagetitle = request.getParameter("txtImg");
        String content = request.getParameter("txtContent");
        LocalDate now = LocalDate.now();

        String oldimgtitle = request.getParameter("txtOldimg");

        if (imagetitle.equalsIgnoreCase("")) {
            NewsDAO a = new NewsDAO();
            a.Update_news(title, oldimgtitle, content, session.getAttribute("NAME").toString(), now.toString(), Integer.parseInt(id));
        } else {
            NewsDAO a = new NewsDAO();
            a.Update_news(title, imagetitle, content, session.getAttribute("NAME").toString(), now.toString(), Integer.parseInt(id));
        }

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "remove_news/{id}")
    public String news_edit(ModelMap model, HttpServletRequest request, @PathVariable int id) {
        HttpSession session = request.getSession(false);

        if (id > 0) {
            NewsDAO a = new NewsDAO();
            a.Delete_news(id);
        }

        return "redirect:" + session.getAttribute("uri").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "add_new_product")
    public String add_new_product(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtProductname");
        String detail = request.getParameter("txtDetail");
        String price = request.getParameter("txtPrice");
        String discount = request.getParameter("txtDiscount");
        String brand = request.getParameter("txtBrand");
        String img1 = request.getParameter("txtImage1");
        String img2 = request.getParameter("txtImage2");
        String catalogid = request.getParameter("txtSubcategory");

        Products a = new Products(name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, img1, img2, Integer.parseInt(catalogid));
        ProductsDAO products = new ProductsDAO();
        products.InsertProduct(a);

        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "edit_product")
    public String edit_product(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String id = request.getParameter("txtId");
        String name = request.getParameter("txtProductname");
        String detail = request.getParameter("txtDetail");
        String price = request.getParameter("txtPrice");
        String discount = request.getParameter("txtDiscount");
        String brand = request.getParameter("txtBrand");
        String img1 = request.getParameter("txtImage1");
        String img2 = request.getParameter("txtImage2");
        String catalogid = request.getParameter("txtSubcategory");

        String oldimg1 = request.getParameter("txtOldimg1");
        String oldimg2 = request.getParameter("txtOldimg2");

        if (img1.equalsIgnoreCase("") || img2.equalsIgnoreCase("")) {
            if (img1.equalsIgnoreCase("")) {
                Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, oldimg1, img2, Integer.parseInt(catalogid));
                ProductsDAO products = new ProductsDAO();
                products.Update_product_with_2_img(a);
            } else if (img2.equalsIgnoreCase("")) {
                Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, img1, oldimg2, Integer.parseInt(catalogid));
                ProductsDAO products = new ProductsDAO();
                products.Update_product_with_2_img(a);
            } else if (img1.equalsIgnoreCase("") && img2.equalsIgnoreCase("")) {
                Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, oldimg1, oldimg2, Integer.parseInt(catalogid));
                ProductsDAO products = new ProductsDAO();
                products.Update_product_with_2_img(a);
            }
        } else {
            Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, img1, img2, Integer.parseInt(catalogid));
            ProductsDAO products = new ProductsDAO();
            products.Update_product_with_2_img(a);
        }
        return "redirect:" + session.getAttribute("uri").toString();
    }

    @RequestMapping(value = "remove_product/{id}")
    public String remove_product(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        if (id > 0) {
            ProductsDAO products = new ProductsDAO();
            products.Delete_product(id);
        }

        return "redirect:" + session.getAttribute("uri").toString();
    }
}
