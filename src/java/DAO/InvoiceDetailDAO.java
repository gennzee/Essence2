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
import model.InvoiceDetail;

/**
 *
 * @author tanks
 */
public class InvoiceDetailDAO {

    public InvoiceDetailDAO() {
    }

    public List<InvoiceDetail> showInvoiceDetail_with_ID(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select id.Id, p.Name, id.Price, id.Quantity\n"
                    + "  from InvoiceDetail id\n"
                    + "  inner join Invoice i on i.Id = id.InvoiceID\n"
                    + "  inner join Product p on p.Id = id.ProductID\n"
                    + "  inner join Supplier s on s.Id = i.SupplierID\n"
                    + "  where i.Id = " + idd + "";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<InvoiceDetail> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int price = rs.getInt(3);
                int quantity = rs.getInt(4);
                InvoiceDetail a = new InvoiceDetail(id, name, price, quantity);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showInvoiceDetail_with_ID(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public boolean add_invoice_detail(int productid, int price, int quantity, int invoiceid) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into InvoiceDetail values(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productid);
            ps.setInt(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, invoiceid);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_invoice_detail(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean edit_invoice_detail(int id, int productid, int price, int quantity, int invoiceid) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update InvoiceDetail set ProductID = ?, Price = ?, Quantity = ?, InvoiceID = ? where Id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productid);
            ps.setInt(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, invoiceid);
            ps.setInt(5, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("edit_invoice_detail(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete_invoice_detail(int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "delete from InvoiceDetail where Id like " + id + "";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("delete_invoice_detail(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
