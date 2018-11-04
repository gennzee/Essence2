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
import model.Orders;

/**
 *
 * @author tanks
 */
public class OrderDAO {

    public OrderDAO() {
    }

    public List<Orders> listOrders(String useridd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Orders where UserID = '" + useridd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int total = rs.getInt(2);
                String date = rs.getString(3);
                String username = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                String note = rs.getString(7);
                int userid = rs.getInt(8);
                int shipperid = rs.getInt(9);
                int paymentstatus = rs.getInt(10);
                Orders a = new Orders(id, total, date, username, phone, address, note, userid, shipperid, paymentstatus);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("listOrders(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Orders> listOrders_is_(String status) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select o.Id, o.Total, o.OrderDate, o.Name, o.Phone, o.Address, o.Note, u.Name, s.Name, u.Phone as UserPhone, ps.Status\n"
                    + "from Orders o\n"
                    + "inner join PaymentStatus ps on ps.Id = o.PaymentStsID\n"
                    + "inner join Shipper s on s.Id = o.ShipperID\n"
                    + "inner join Users u on u.Id = o.UserID\n"
                    + "where ps.Status like '" + status + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int total = rs.getInt(2);
                String date = rs.getString(3);
                String name = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                String note = rs.getString(7);
                String username = rs.getString(8);
                String shippername = rs.getString(9);
                String userphone = rs.getString(10);
                String paymentstatusname = rs.getString(11);
                Orders a = new Orders(id, total, date, name, phone, address, note, username, userphone, shippername, paymentstatusname);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("listOrders_is_(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public boolean edit_processing_to_delivering_with_shipper(int id, int paymentstatus, int shipper) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Orders set ShipperID = ?, PaymentStsID = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, shipper);
            ps.setInt(2, paymentstatus);
            ps.setInt(3, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("edit_processing_to_delivering_with_shipper(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean edit_delivering_to_delivered(int id, int paymentstatus) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Orders set PaymentStsID = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, paymentstatus);
            ps.setInt(2, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("edit_delivering_to_delivered(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public List<Orders> listOrders_with_date(String datee) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select o.Id, o.Total, o.OrderDate, o.Name, o.Phone, o.Address, o.Note, u.Name, s.Name, u.Phone as UserPhone, ps.Status\n"
                    + "from Orders o\n"
                    + "inner join PaymentStatus ps on ps.Id = o.PaymentStsID\n"
                    + "inner join Shipper s on s.Id = o.ShipperID\n"
                    + "inner join Users u on u.Id = o.UserID\n"
                    + "where o.OrderDate like '%" + datee + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Orders> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int total = rs.getInt(2);
                String date = rs.getString(3);
                String name = rs.getString(4);
                String phone = rs.getString(5);
                String address = rs.getString(6);
                String note = rs.getString(7);
                String username = rs.getString(8);
                String shippername = rs.getString(9);
                String userphone = rs.getString(10);
                String paymentstatusname = rs.getString(11);
                Orders a = new Orders(id, total, date, name, phone, address, note, username, userphone, shippername, paymentstatusname);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("listOrders_with_date(DAO)");
            e.printStackTrace();
        }
        return null;
    }

}
