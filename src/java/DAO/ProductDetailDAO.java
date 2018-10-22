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
import model.Products;

/**
 *
 * @author tanks
 */
public class ProductDetailDAO {

    public ProductDetailDAO() {
    }

    public List<Products> findOne_Id_of_Product(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Product where Id like +'" + idd + "'";
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
            System.out.println("findOne_Id_of_Product(ProductDetailDAO)");
            e.printStackTrace();
        }
        return null;
    }
}
