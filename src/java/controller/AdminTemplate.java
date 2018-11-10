/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ContactDAO;
import DAO.InvoiceDAO;
import DAO.InvoiceDetailDAO;
import DAO.NavigationBarDAO;
import DAO.NewsDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDetailDAO;
import DAO.ProductsDAO;
import DAO.ShipperDAO;
import DAO.StatisticsDAO;
import DAO.SupplierDAO;
import DAO.UsersDAO;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Catalog;
import model.Contact;
import model.Invoice;
import model.InvoiceDetail;
import model.NavigationBarr;
import model.News;
import model.OrderDetail;
import model.OrderDetailWithId;
import model.Orders;
import model.Products;
import model.Shipper;
import model.Supplier;
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

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/nav_items";
    }

    @RequestMapping(value = "new_category", method = RequestMethod.POST)
    public String new_category(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtCategory");

        NavigationBarDAO a = new NavigationBarDAO();
        a.InsertNav(name);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "new_catalog", method = RequestMethod.POST)
    public String new_catalog(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtSubcategory");
        String navid = request.getParameter("txtNavid");

        NavigationBarDAO a = new NavigationBarDAO();
        a.InsertCatalog(name, Integer.parseInt(navid));

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "edit_category", method = RequestMethod.POST)
    public String edit_category(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtCategory");
        String id = request.getParameter("txtCategoryid");

        NavigationBarDAO a = new NavigationBarDAO();
        a.UpdateNav(name, Integer.parseInt(id));

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "edit_catalog", method = RequestMethod.POST)
    public String edit_catalog(ModelMap model, HttpSession session, HttpServletRequest request) {
        session = request.getSession(false);

        String name = request.getParameter("txtSubcategory");
        String id = request.getParameter("txtSubcategoryid");

        NavigationBarDAO a = new NavigationBarDAO();
        a.UpdateCatalog(name, Integer.parseInt(id));

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "remove_category/{id}")
    public String remove_category(ModelMap model, HttpSession session, HttpServletRequest request, @PathVariable int id) {
        session = request.getSession(false);

        NavigationBarDAO a = new NavigationBarDAO();
        a.DeleteNav(id);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "remove_catalog/{id}")
    public String remove_catalog(ModelMap model, HttpSession session, HttpServletRequest request, @PathVariable int id) {
        session = request.getSession(false);

        NavigationBarDAO a = new NavigationBarDAO();
        a.DeleteCatalog(id);

        return "redirect:" + session.getAttribute("urii").toString();
    }

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "users")
    public String users(ModelMap model, HttpSession session, HttpServletRequest request) {

        List<Users> ds = new ArrayList<>();
        UsersDAO a = new UsersDAO();
        ds = a.showList_users_admin(1);

        model.addAttribute("list_users_admin", ds);
        model.addAttribute("list_users_admin_size", ds.size());

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/user";
    }

    @RequestMapping(value = "users_inactive")
    public String users_inactive(ModelMap model, HttpSession session, HttpServletRequest request) {

        List<Users> ds = new ArrayList<>();
        UsersDAO a = new UsersDAO();
        ds = a.showList_users_admin(0);

        model.addAttribute("list_users_admin", ds);
        model.addAttribute("list_users_admin_size", ds.size());

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/user_inactive";
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
        
        
        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "remove_user/{id}")
    public String edit_user(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        if (id > 0) {
            UsersDAO user = new UsersDAO();
            user.Delete(0, id);// ẩn về inactive - isActive = 0
        }

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "revert_user/{id}")
    public String revert_user(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        if (id > 0) {
            UsersDAO user = new UsersDAO();
            user.Delete(1, id); // revert về active - isActive = 1
        }

        return "redirect:" + session.getAttribute("urii").toString();
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

        return "redirect:" + session.getAttribute("urii").toString();
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

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/news";
    }

    @RequestMapping(value = "view_add_news")
    public String view_add_news(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        return "admin/news_add";
    }

    @RequestMapping(value = "add_news")
    public String add_news(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String title = request.getParameter("txtTitle");
        String imagetitle = request.getParameter("txtImg");
        String content = request.getParameter("txtContent");
        LocalDate now = LocalDate.now();

        NewsDAO a = new NewsDAO();
        a.add_news(title, content, session.getAttribute("NAME").toString(), now.toString(), imagetitle);

        return "redirect:" + session.getAttribute("urii").toString();

    }

    @RequestMapping(value = "news_edit")
    public String news_edit(ModelMap model, HttpServletRequest request) {
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

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "remove_news/{id}")
    public String news_edit(ModelMap model, HttpServletRequest request, @PathVariable int id) {
        HttpSession session = request.getSession(false);

        if (id > 0) {
            NewsDAO a = new NewsDAO();
            a.Delete_news(id);
        }

        return "redirect:" + session.getAttribute("urii").toString();
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

        return "redirect:" + session.getAttribute("urii").toString();
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
            if (img1.equalsIgnoreCase("") && img2.equalsIgnoreCase("")) {
                Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, oldimg1, oldimg2, Integer.parseInt(catalogid));
                ProductsDAO products = new ProductsDAO();
                products.Update_product_with_2_img(a);
            } else if (img1.equalsIgnoreCase("") && img2.equalsIgnoreCase(img2)) {
                Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, oldimg1, img2, Integer.parseInt(catalogid));
                ProductsDAO products = new ProductsDAO();
                products.Update_product_with_2_img(a);
            } else if (img2.equalsIgnoreCase("") && img1.equalsIgnoreCase(img1)) {
                Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, img1, oldimg2, Integer.parseInt(catalogid));
                ProductsDAO products = new ProductsDAO();
                products.Update_product_with_2_img(a);
            }
        } else {
            Products a = new Products(Integer.parseInt(id), name, detail, Integer.parseInt(price), Integer.parseInt(discount), brand, img1, img2, Integer.parseInt(catalogid));
            ProductsDAO products = new ProductsDAO();
            products.Update_product_with_2_img(a);
        }
        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "remove_product/{id}")
    public String remove_product(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        if (id > 0) {
            ProductsDAO products = new ProductsDAO();
            products.Delete_product(id);
        }

        return "redirect:" + session.getAttribute("urii").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "contact")
    public String contact(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        List<Contact> ds = new ArrayList<>();
        ContactDAO a = new ContactDAO();
        ds = a.showContact();

        model.addAttribute("contact", ds);

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/contact_manage";
    }

    @RequestMapping(value = "contact_edit")
    public String contact_edit(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        String title = request.getParameter("txtTitle");
        String googlemap = request.getParameter("txtGooglemap");
        String content = request.getParameter("txtContent");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");

        Contact a = new Contact(googlemap, title, content, address, phone, email);
        ContactDAO b = new ContactDAO();
        b.editContact(a);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "supplier")
    public String supplier(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        List<Supplier> ds = new ArrayList<Supplier>();
        SupplierDAO a = new SupplierDAO();
        ds = a.showSupplier();

        model.addAttribute("list_supplier", ds);
        model.addAttribute("list_supplier_size", ds.size());

        List<Supplier> ds2 = new ArrayList<Supplier>();
        ds2 = a.show_hided_supplier();

        model.addAttribute("list_supplier_hided", ds2);
        model.addAttribute("list_supplier_size_hided", ds2.size());

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/supplier";
    }

    @RequestMapping(value = "hided_supplier/{id}")
    public String hided_supplier(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        SupplierDAO a = new SupplierDAO();
        a.hide_supplier(0, id);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "add_supplier")
    public String add_supplier(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        String name = request.getParameter("txtSuppliername");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");
        String company = request.getParameter("txtCompany");
        String status = request.getParameter("txtStatus");

        Supplier a = new Supplier(name, address, phone, email, company, status);
        SupplierDAO b = new SupplierDAO();
        b.add_supplier(a);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "revert_supplier/{id}")
    public String revert_supplier(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        SupplierDAO a = new SupplierDAO();
        a.hide_supplier(1, id);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "edit_supplier")
    public String edit_supplier(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        int id = Integer.parseInt(request.getParameter("txtId"));
        String name = request.getParameter("txtSuppliername");
        String address = request.getParameter("txtAddress");
        String phone = request.getParameter("txtPhone");
        String email = request.getParameter("txtEmail");
        String company = request.getParameter("txtCompany");
        String status = request.getParameter("txtStatus");

        Supplier a = new Supplier(id, name, address, phone, email, company, status);
        SupplierDAO b = new SupplierDAO();
        b.edit_supplier(a);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "invoice")
    public String invoice(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        List<Invoice> ds = new ArrayList<>();
        InvoiceDAO a = new InvoiceDAO();
        ds = a.showInvoice();

        List<Supplier> ds2 = new ArrayList<>();
        SupplierDAO b = new SupplierDAO();
        ds2 = b.showSupplier();

        model.addAttribute("listInvoice", ds);
        model.addAttribute("listInvoice_size", ds.size());
        model.addAttribute("listSupplier", ds2);

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/invoice";
    }

    @RequestMapping(value = "invoice_with_id/{id}")
    public String invoice_with_id(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        List<Invoice> ds = new ArrayList<>();
        InvoiceDAO a = new InvoiceDAO();
        ds = a.showInvoice_with_ID(id);

        List<Supplier> ds2 = new ArrayList<>();
        SupplierDAO b = new SupplierDAO();
        ds2 = b.showSupplier();

        model.addAttribute("listInvoice", ds);
        model.addAttribute("listInvoice_size", ds.size());
        model.addAttribute("listSupplier", ds2);
        model.addAttribute("supplier_default", id);

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/invoice_with_id";
    }

    @RequestMapping(value = "invoice_detail_with_id/{id}")
    public String invoice_detail_with_id(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        List<InvoiceDetail> ds = new ArrayList<>();
        InvoiceDetailDAO a = new InvoiceDetailDAO();
        ds = a.showInvoiceDetail_with_ID(id);

        List<Products> ds2 = new ArrayList<>();
        ProductsDAO b = new ProductsDAO();
        ds2 = b.showProducts();
        model.addAttribute("listProduct_active", ds2);
        ds2 = b.listProduct_doesnt_have_invoice();
        model.addAttribute("listProduct_inactive", ds2);

        model.addAttribute("invoice_id", id);
        model.addAttribute("listInvoice", ds);
        model.addAttribute("listInvoice_size", ds.size());

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/invoice_detail_with_id";
    }

    @RequestMapping(value = "add_invoice")
    public String add_invoice(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        int totalprice = Integer.parseInt(request.getParameter("txtTotalprice"));
        String date = request.getParameter("txtDate");
        int supplierid = Integer.parseInt(request.getParameter("txtSupplier"));

        InvoiceDAO a = new InvoiceDAO();
        a.add_invoice(totalprice, date, supplierid);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "edit_invoice")
    public String edit_invoice(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        int id = Integer.parseInt(request.getParameter("txtId"));
        int totalprice = Integer.parseInt(request.getParameter("txtTotalprice"));
        String date = request.getParameter("txtDate");
        int supplierid = Integer.parseInt(request.getParameter("txtSupplier"));

        InvoiceDAO a = new InvoiceDAO();
        a.edit_invoice(id, totalprice, date, supplierid);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "add_invoice_detail")
    public String add_invoice_detail(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        int productid = Integer.parseInt(request.getParameter("txtProductid"));
        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
        int price = Integer.parseInt(request.getParameter("txtTotalprice"));
        int invoiceid = Integer.parseInt(request.getParameter("txtInvoiceid"));

        InvoiceDetailDAO a = new InvoiceDetailDAO();
        a.add_invoice_detail(productid, price, quantity, invoiceid);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "edit_invoice_detail")
    public String edit_invoice_detail(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        int productid = Integer.parseInt(request.getParameter("txtProductid"));
        int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
        int price = Integer.parseInt(request.getParameter("txtTotalprice"));
        int invoiceid = Integer.parseInt(request.getParameter("txtInvoiceid"));
        int id = Integer.parseInt(request.getParameter("txtId"));

        InvoiceDetailDAO a = new InvoiceDetailDAO();
        a.edit_invoice_detail(id, productid, price, quantity, invoiceid);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "delete_invoice_detail/{id}")
    public String edit_invoice_detail(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        InvoiceDetailDAO a = new InvoiceDetailDAO();
        a.delete_invoice_detail(id);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "order_is_processing")
    public String order_is_processing(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        List<Orders> ds = new ArrayList<>();
        OrderDAO a = new OrderDAO();
        ds = a.listOrders_is_("Processing");

        List<Shipper> ds2 = new ArrayList<>();
        ShipperDAO b = new ShipperDAO();
        ds2 = b.showShipper(1);// show isActive shipper

        model.addAttribute("listOrders_processing", ds);
        model.addAttribute("listShipper", ds2);

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/order_processing";
    }

    @RequestMapping(value = "edit_order_to_delivering")
    public String edit_order_to_delivering(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        try {

            if (request.getParameterValues("chkId") != null) {
                for (String orderid : request.getParameterValues("chkId")) {
                    int shipperid = Integer.parseInt(request.getParameter("txtShipper"));
                    OrderDAO a = new OrderDAO();
                    a.edit_processing_to_delivering_with_shipper(Integer.parseInt(orderid), 2, shipperid);
                }
            }

        } catch (Exception e) {
            System.out.println("edit_order_to_delivering(AdminTemplate)");
            e.printStackTrace();
            return "redirect:" + session.getAttribute("urii").toString();
        }

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "order_is_Delivering")
    public String order_is_Delivering(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        List<Orders> ds = new ArrayList<>();
        OrderDAO a = new OrderDAO();
        ds = a.listOrders_is_("Delivering");

        model.addAttribute("listOrders_delivering", ds);

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/order_delivering";
    }

    @RequestMapping(value = "edit_order_to_delivered")
    public String edit_order_to_delivered(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        try {

            if (request.getParameterValues("chkId") != null) {
                for (String orderid : request.getParameterValues("chkId")) {
                    OrderDAO a = new OrderDAO();
                    a.edit_delivering_to_delivered(Integer.parseInt(orderid), 3);
                }
            }

        } catch (Exception e) {
            System.out.println("edit_order_to_delivering(AdminTemplate)");
            e.printStackTrace();
            return "redirect:" + session.getAttribute("urii").toString();
        }

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "search_order")
    public String search_order(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        String date = request.getParameter("txtDate");

        if (date != null) {

            List<Orders> ds = new ArrayList<>();
            OrderDAO a = new OrderDAO();
            ds = a.listOrders_with_date(date);

            model.addAttribute("listOrders_search", ds);

            return "admin/search_order";
        } else {
            return "admin/search_order";
        }
    }

    @RequestMapping(value = "order_detail/{id}")
    public String order_detail(ModelMap model, HttpServletRequest request, HttpSession session, @PathVariable int id) {
        session = request.getSession(false);

        List<OrderDetailWithId> ds = new ArrayList<>();
        OrderDetailDAO a = new OrderDetailDAO();
        ds = a.listOrderDetail(id);

        model.addAttribute("listOrder_detail", ds);
        model.addAttribute("orderid", id);

        return "admin/order_detail";
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "profile")
    public String profile(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        String username = session.getAttribute("USER").toString();

        UsersDAO users = new UsersDAO();
        List<Users> ds2 = new ArrayList<Users>();
        ds2 = users.showUsers(username);

        model.addAttribute("logged_in_user", ds2);

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/profile";
    }

    @RequestMapping(value = "edit_profile")
    public String edit_profile(ModelMap model, HttpServletRequest request, HttpSession session) {
        session = request.getSession(false);

        String username = session.getAttribute("USER").toString();
        String id = session.getAttribute("ID").toString();
        String name = request.getParameter("txtName");
        String role = session.getAttribute("ROLE_ID").toString();
        String email = request.getParameter("txtEmail");
        String address = request.getParameter("txtAddress");
        String image = request.getParameter("txtImage");
        String phone = request.getParameter("txtPhone");

        String pass = request.getParameter("txtPass");
        String oldimage = request.getParameter("txtOldimage");

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
                session.setAttribute("IMGUSER", image);
            }
        } else {
            UsersDAO user = new UsersDAO();
            Users a = new Users(username, pass, name, email, Integer.parseInt(role), image, phone, address);

            user.Update_user_with_password_and_image_is_not_null(a, id);
            session.setAttribute("IMGUSER", image);
        }

        return "redirect:" + session.getAttribute("urii").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "shipper")
    public String shipper(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        List<Shipper> ds2 = new ArrayList<>();
        ShipperDAO b = new ShipperDAO();
        ds2 = b.showShipper(1);// show isActive shipper

        model.addAttribute("listShipper", ds2);
        model.addAttribute("listShipper_size", ds2.size());

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/shipper";
    }

    @RequestMapping(value = "shipper_inactive")
    public String shipper_inactive(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        List<Shipper> ds2 = new ArrayList<>();
        ShipperDAO b = new ShipperDAO();
        ds2 = b.showShipper(0);// show isActive shipper

        model.addAttribute("listShipper", ds2);
        model.addAttribute("listShipper_size", ds2.size());

        session.setAttribute("urii", request.getRequestURI().substring(request.getContextPath().length()));
        return "admin/shipper_inactive";
    }

    @RequestMapping(value = "add_shipper")
    public String add_shipper(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String name = request.getParameter("txtName");
        String phone = request.getParameter("txtPhone");

        Shipper a = new Shipper(name, phone);
        ShipperDAO b = new ShipperDAO();
        b.add_shipper(a);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "delete_shipper/{id}")
    public String delete_shipper(ModelMap model, HttpServletRequest request, @PathVariable int id) {
        HttpSession session = request.getSession(false);

        ShipperDAO b = new ShipperDAO();
        b.deleteShipper(0, id);// hide shipper set isActive = 0

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "revert_shipper/{id}")
    public String revert_shipper(ModelMap model, HttpServletRequest request, @PathVariable int id) {
        HttpSession session = request.getSession(false);

        ShipperDAO b = new ShipperDAO();
        b.deleteShipper(1, id);// revert shipper set isActive = 1

        return "redirect:" + session.getAttribute("urii").toString();
    }

    @RequestMapping(value = "edit_shipper")
    public String edit_shipper(ModelMap model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        String id = request.getParameter("txtId");
        String name = request.getParameter("txtName");
        String phone = request.getParameter("txtPhone");

        Shipper a = new Shipper(Integer.parseInt(id), name, phone);
        ShipperDAO b = new ShipperDAO();
        b.updateShipper(a);

        return "redirect:" + session.getAttribute("urii").toString();
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    @RequestMapping(value = "dashboard")
    public String dashboard(ModelMap model, HttpServletRequest request) {
        LocalDate now = LocalDate.now();
        int month = now.getMonthValue();
        int year = now.getYear();

        List<Orders> ds = new ArrayList<>();
        OrderDAO a2 = new OrderDAO();
        ds = a2.listOrders_is_("Processing");
        //list order is in processing
        model.addAttribute("listOrder_processing", ds);
        ds = a2.listOrders_is_("Delivering");
        //list order is in delivering
        model.addAttribute("listOrder_delivering", ds);

        StatisticsDAO a = new StatisticsDAO();

        //orders in month
        model.addAttribute("orders_in_this_month", a.show_orders_in_month(year + "-" + month));
        //collections in month
        model.addAttribute("collections_in_this_month", a.show_collections_in_month(year + "-" + month));
        //customers in month
        model.addAttribute("customers_created_in_this_month", a.show_created_customers_in_month(year + "-" + month));
        //orders canceled in month
        model.addAttribute("orders_canceled_in_this_month", a.show_orders_status_in_month(year + "-" + month, 4));
        //orders delivered in month
        model.addAttribute("orders_delivered_in_this_month", a.show_orders_status_in_month(year + "-" + month, 3));
        //sum revenue in month
        model.addAttribute("sum_revenue_in_month", a.show_revenue_in_month(year + "-" + month, 3));
        //orders in today
        model.addAttribute("orders_in_today", a.show_orders_in_month(now.toString()));
        //orders processing in today
        model.addAttribute("orders_pending_in_today", a.show_orders_status_in_month(now.toString(), 1));
        //orders delivering in today
        model.addAttribute("orders_delivering_in_today", a.show_orders_status_in_month(now.toString(), 2));
        //orders canceled in today
        model.addAttribute("orders_canceled_in_today", a.show_orders_status_in_month(now.toString(), 4));
        return "admin/dashboard";
    }
}
