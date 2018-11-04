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
import model.Shipper;

/**
 *
 * @author tanks
 */
public class ShipperDAO {

    public ShipperDAO() {
    }

    public List<Shipper> showShipper() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Shipper where Id > 1";
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
}
