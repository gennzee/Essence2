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
import model.Shipper;

/**
 *
 * @author tanks
 */
public class ShipperDAO {

    public ShipperDAO() {
    }

    public List<Shipper> showShipper(int isActive) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Shipper where Id > 1 and isActive = " + isActive + "";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Shipper> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String phone = rs.getString(3);
                Shipper a = new Shipper(id, name, phone);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean deleteShipper(int isActive, int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Shipper set isActive = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, isActive);
            ps.setInt(2, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("deleteShipper(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateShipper(Shipper shipper) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Shipper set Name = ?, Phone = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shipper.getName());
            ps.setString(2, shipper.getPhone());
            ps.setInt(3, shipper.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("updateShipper(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean add_shipper(Shipper shipper) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Shipper values(?,?,1)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, shipper.getName());
            ps.setString(2, shipper.getPhone());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_shipper(DAO)");
            e.printStackTrace();
        }
        return false;
    }

}
