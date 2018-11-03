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
import model.Supplier;

/**
 *
 * @author tanks
 */
public class SupplierDAO {

    public SupplierDAO() {
    }

    public List<Supplier> showSupplier() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Supplier where Status = 1";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Supplier> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String address = rs.getString(3);
                String phone = rs.getString(4);
                String email = rs.getString(5);
                String company = rs.getString(6);
                String status = rs.getString(7);
                Supplier a = new Supplier(id, name, address, phone, email, company, status);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<Supplier> show_hided_supplier() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Supplier where Status = 0";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Supplier> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String address = rs.getString(3);
                String phone = rs.getString(4);
                String email = rs.getString(5);
                String company = rs.getString(6);
                String status = rs.getString(7);
                Supplier a = new Supplier(id, name, address, phone, email, company, status);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean hide_supplier(int status, int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Supplier set Status = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("hide_supplier(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean add_supplier(Supplier supplier) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Supplier values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, supplier.getName());
            ps.setString(2, supplier.getAddress());
            ps.setString(3, supplier.getPhone());
            ps.setString(4, supplier.getEmail());
            ps.setString(5, supplier.getCompany());
            ps.setString(6, supplier.getStatus());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_supplier(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean edit_supplier(Supplier supplier) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Supplier set Name = ?, Address = ?, Phone = ?, Email = ?, Company = ?, Status = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, supplier.getName());
            ps.setString(2, supplier.getAddress());
            ps.setString(3, supplier.getPhone());
            ps.setString(4, supplier.getEmail());
            ps.setString(5, supplier.getCompany());
            ps.setString(6, supplier.getStatus());
            ps.setInt(7, supplier.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("edit_supplier(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
