/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Users;
import model.Wishlist;

/**
 *
 * @author tanks
 */
public class WishlistDAO {

    public WishlistDAO() {
    }

    public List<Wishlist> showWishlist(String IdOfUser) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select Wishlist.*, Product.*\n"
                    + "from Wishlist\n"
                    + "inner join Product\n"
                    + "on Wishlist.ProductId = Product.Id\n"
                    + "where Wishlist.UserId = '" + IdOfUser + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Wishlist> list = new ArrayList<Wishlist>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int userid = rs.getInt(2);
                int productid = rs.getInt(3);
                String productname = rs.getString(5);
                String productbrand = rs.getString("Brand");
                int productdiscount = rs.getInt("Discount");
                int productprice = rs.getInt("Price");
                Wishlist a = new Wishlist(id, userid, productid, productname, productbrand, productdiscount, productprice);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showWishlist(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public boolean Insert(int userid, int productid) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Wishlist values(?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userid);
            ps.setInt(2, productid);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("InsertWishlist(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean Delete(int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Delete from Wishlist where Id like'" + id + "'";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("DeleteWishlist(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
