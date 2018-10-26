/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Products;

/**
 *
 * @author tanks
 */
public class SaleDAO {

    public SaleDAO() {
    }
    
    
        public List<Products> showSale() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Product where Discount > 0";
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
                int supplierid = rs.getInt(11);
                Products a = new Products(id, name, detail, price, discount, quantity, brand, img1, img2, catalogid, supplierid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showSale(DAO)");
            e.printStackTrace();
        }
        return null;
    }
    
    
}
