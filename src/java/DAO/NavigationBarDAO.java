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
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Catalog;
import model.NavigationBarr;

/**
 *
 * @author tanks
 */
public class NavigationBarDAO {

    public NavigationBarDAO() {
    }


    public List<NavigationBarr> showNav2() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from NavMenu";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<NavigationBarr> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                NavigationBarr a = new NavigationBarr(id, name);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showNav2(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<Catalog> showCatalog() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Catalog";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Catalog> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int navid = rs.getInt(3);
                Catalog a = new Catalog(id, name, navid);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showNav2(DAO)");
            e.printStackTrace();
        }
        return null;
    }
}
