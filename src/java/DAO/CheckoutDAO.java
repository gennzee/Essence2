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
import model.Orders;
import model.OrderDetail;

/**
 *
 * @author tanks
 */
public class CheckoutDAO {

    public CheckoutDAO() {
    }

    public boolean add_order(Orders orders) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Orders values (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orders.getTotal());
            ps.setString(2, orders.getOrderdate());
            ps.setString(3, orders.getName());
            ps.setString(4, orders.getPhone());
            ps.setString(5, orders.getAddress());
            ps.setString(6, orders.getNote());
            ps.setInt(7, orders.getUserid());
            ps.setInt(8, orders.getShipperid());
            ps.setInt(9, orders.getPaymentstatus());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_order(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public int select_id_just_added_to_order() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "SELECT MAX(Id) FROM Orders";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                return id;
            }
        } catch (Exception e) {
            System.out.println("select_id_just_added_to_order(DAO)");
            e.printStackTrace();
        }
        return 0;
    }

    public boolean add_orderdetail(OrderDetail orderDetail) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into OrderDetail values (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, orderDetail.getQuantity());
            ps.setInt(2, orderDetail.getOrderid());
            ps.setInt(3, orderDetail.getProductid());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_orderdetail(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
