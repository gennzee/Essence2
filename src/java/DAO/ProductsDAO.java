/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Catalog;
import model.Products;

/**
 *
 * @author tanks
 */
public class ProductsDAO {

    public ProductsDAO() {
    }

    public List<Products> showProducts() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select p.Id, p.Name, p.Detail, p.Price, p.Discount, sum(i.Quantity) as Quantity, p.Brand, p.Img1, p.Img2, p.CatalogID\n"
                    + "  from Product p\n"
                    + "  inner join InvoiceDetail i on i.ProductID = p.Id\n"
                    + "  group by p.Id, p.Name, p.Detail, p.Price, p.Discount, p.Brand, p.Img1, p.Img2, p.CatalogID";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String detail = rs.getString(3);
                int price = rs.getInt(4);
                int discount = rs.getInt(5);
                int quantity = rs.getInt(6);
                String brand = rs.getString(7);
                String img1 = rs.getString(8);
                String img2 = rs.getString(9);
                int catalogid = rs.getInt(10);
                Products a = new Products(id, name, detail, price, discount, quantity, brand, img1, img2, catalogid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showProducts(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> showProducts_select(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select p.Id, p.Name, p.Detail, p.Price, p.Discount, sum(i.Quantity) as Quantity, p.Brand, p.Img1, p.Img2, p.CatalogID\n"
                    + "  from Product p\n"
                    + "  inner join InvoiceDetail i on i.ProductID = p.Id\n"
                    + "  where p.CatalogID like " + idd + "\n"
                    + "  group by p.Id, p.Name, p.Detail, p.Price, p.Discount, p.Brand, p.Img1, p.Img2, p.CatalogID";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String detail = rs.getString(3);
                int price = rs.getInt(4);
                int discount = rs.getInt(5);
                int quantity = rs.getInt(6);
                String brand = rs.getString(7);
                String img1 = rs.getString(8);
                String img2 = rs.getString(9);
                int catalogid = rs.getInt(10);
                Products a = new Products(id, name, detail, price, discount, quantity, brand, img1, img2, catalogid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showProducts_select(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> Search(String txtName) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select p.Id, p.Name, p.Detail, p.Price, p.Discount, sum(i.Quantity) as Quantity, p.Brand, p.Img1, p.Img2, p.CatalogID\n"
                    + "  from Product p\n"
                    + "  inner join InvoiceDetail i on i.ProductID = p.Id\n"
                    + "  where p.Name like '%" + txtName + "%'\n"
                    + "  group by p.Id, p.Name, p.Detail, p.Price, p.Discount, p.Brand, p.Img1, p.Img2, p.CatalogID";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String detail = rs.getString(3);
                int price = rs.getInt(4);
                int discount = rs.getInt(5);
                int quantity = rs.getInt(6);
                String brand = rs.getString(7);
                String img1 = rs.getString(8);
                String img2 = rs.getString(9);
                int catalogid = rs.getInt(10);
                Products a = new Products(id, name, detail, price, discount, quantity, brand, img1, img2, catalogid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Search(ProductsDAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Catalog> shop_title(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Catalog where Id like '" + idd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Catalog> list = new ArrayList<Catalog>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int navid = rs.getInt(3);
                Catalog a = new Catalog(id, name, navid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("shop_title(ProductsDAO)");
            e.printStackTrace();
        }
        return null;
    }

    public boolean InsertProduct(Products products) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Product values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, products.getName());
            ps.setString(2, products.getDetail());
            ps.setInt(3, products.getPrice());
            ps.setInt(4, products.getDiscount());
            ps.setString(5, products.getBrand());
            ps.setString(6, products.getImg1());
            ps.setString(7, products.getImg2());
            ps.setInt(8, products.getCatalogid());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("InsertProduct(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean Update_product_with_2_img(Products products) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Product set Name = ?, Detail = ?, Price = ?, Discount = ?, Brand = ?, Img1 = ?, Img2 = ?, CatalogID = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, products.getName());
            ps.setString(2, products.getDetail());
            ps.setInt(3, products.getPrice());
            ps.setInt(4, products.getDiscount());
            ps.setString(5, products.getBrand());
            ps.setString(6, products.getImg1());
            ps.setString(7, products.getImg2());
            ps.setInt(8, products.getCatalogid());
            ps.setInt(9, products.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Delete_product(int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Delete from Product where Id like " + id + "";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Delete_product(DAO)");
            e.printStackTrace();
        }
        return false;
    }

}
