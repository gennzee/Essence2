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
import model.Invoice;

/**
 *
 * @author tanks
 */
public class InvoiceDAO {

    public InvoiceDAO() {
    }

    public List<Invoice> showInvoice() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select Invoice.Id, Invoice.Total, Invoice.Date, Supplier.Name, Supplier.Phone\n"
                    + "  from Invoice\n"
                    + "  inner join Supplier on Invoice.SupplierID = Supplier.Id";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Invoice> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int total = rs.getInt(2);
                String date = rs.getString(3);
                String name = rs.getString(4);
                String phone = rs.getString(5);
                Invoice a = new Invoice(id, total, date, name, phone);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showInvoice(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Invoice> showInvoice_with_ID(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select Invoice.Id, Invoice.Total, Invoice.Date, Supplier.Name, Supplier.Phone\n"
                    + "  from Invoice\n"
                    + "  inner join Supplier on Invoice.SupplierID = Supplier.Id\n"
                    + "  where Supplier.Id = " + idd + "";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Invoice> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                int total = rs.getInt(2);
                String date = rs.getString(3);
                String name = rs.getString(4);
                String phone = rs.getString(5);
                Invoice a = new Invoice(id, total, date, name, phone);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showInvoice(DAO)");
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean add_invoice(int total, String date, int supplierid){
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Invoice values(?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, total);
            ps.setString(2, date);
            ps.setInt(3, supplierid);
            int rs = ps.executeUpdate();
            if(rs > 0){
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_invoice(DAO)");
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean edit_invoice(int id, int total, String date, int supplierid){
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Invoice set Total = ?, Date = ?, SupplierID = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, total);
            ps.setString(2, date);
            ps.setInt(3, supplierid);
            ps.setInt(4, id);
            int rs = ps.executeUpdate();
            if(rs > 0){
                return true;
            }
        } catch (Exception e) {
            System.out.println("edit_invoice(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
