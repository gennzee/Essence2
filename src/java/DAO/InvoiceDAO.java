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
}
