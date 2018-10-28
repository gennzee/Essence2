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
}
