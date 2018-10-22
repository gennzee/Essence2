/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
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
            String sql = "Select * from Product";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String detail = rs.getString(3);
                int price = rs.getInt(4);
                int discount = rs.getInt(5);
                String date = rs.getString(6);
                int quantity = rs.getInt(7);
                String brand = rs.getString(8);
                String img1 = rs.getString(9);
                String img2 = rs.getString(10);
                int catalogid = rs.getInt(11);
                int supplierid = rs.getInt(12);
                Products a = new Products(id, name, detail, price, discount, date, quantity, brand, img1, img2, catalogid, supplierid);
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
            String sql = "select Catalog.Id, Catalog.Name, Product.*\n"
                    + "from Product \n"
                    + "inner join Catalog on Product.CatalogID=Catalog.Id\n"
                    + "where Catalog.Id like '" + idd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(3);
                String name = rs.getString(4);
                String detail = rs.getString(5);
                int price = rs.getInt(6);
                int discount = rs.getInt(7);
                String date = rs.getString(8);
                int quantity = rs.getInt(9);
                String brand = rs.getString(10);
                String img1 = rs.getString(11);
                String img2 = rs.getString(12);
                int catalogid = rs.getInt(13);
                int supplierid = rs.getInt(14);
                Products a = new Products(id, name, detail, price, discount, date, quantity, brand, img1, img2, catalogid, supplierid);
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
            String sql = "Select * from Product where Name like '%" + txtName + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String detail = rs.getString(3);
                int price = rs.getInt(4);
                int discount = rs.getInt(5);
                String date = rs.getString(6);
                int quantity = rs.getInt(7);
                String brand = rs.getString(8);
                String img1 = rs.getString(9);
                String img2 = rs.getString(10);
                int catalogid = rs.getInt(11);
                int supplierid = rs.getInt(12);
                Products a = new Products(id, name, detail, price, discount, date, quantity, brand, img1, img2, catalogid, supplierid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("Search(ProductsDAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Products> findOne_Catalog(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Product where CatalogID like '" + idd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Products> list = new ArrayList<Products>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String detail = rs.getString(3);
                int price = rs.getInt(4);
                int discount = rs.getInt(5);
                String date = rs.getString(6);
                int quantity = rs.getInt(7);
                String brand = rs.getString(8);
                String img1 = rs.getString(9);
                String img2 = rs.getString(10);
                int catalogid = rs.getInt(11);
                int supplierid = rs.getInt(12);
                Products a = new Products(id, name, detail, price, discount, date, quantity, brand, img1, img2, catalogid, supplierid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("findOne_Catalog(ProductsDAO)");
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

}
