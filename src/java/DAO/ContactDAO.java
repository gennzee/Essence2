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
import model.Contact;

/**
 *
 * @author tanks
 */
public class ContactDAO {

    public ContactDAO() {
    }

    public List<Contact> showContact() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Contact";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Contact> list = new ArrayList<>();
            if (rs.next()) {
                int id = rs.getInt(1);
                String googlemap = rs.getString(2);
                String title = rs.getString(3);
                String content = rs.getString(4);
                String address = rs.getString(5);
                String phone = rs.getString(6);
                String email = rs.getString(7);
                Contact a = new Contact(id, googlemap, title, content, address, phone, email);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean editContact(Contact contact) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Contact set googlemap = ?, title = ?, content = ?, address = ?, phone = ?, email = ? where Id = 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, contact.getGooglemap());
            ps.setString(2, contact.getTitle());
            ps.setString(3, contact.getContent());
            ps.setString(4, contact.getAddress());
            ps.setString(5, contact.getPhone());
            ps.setString(6, contact.getEmail());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("editContact(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
