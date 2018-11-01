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
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Catalog;
import model.NavigationBarr;
import model.Users;

/**
 *
 * @author tanks
 */
public class NavigationBarDAO {

    public NavigationBarDAO() {
    }

    public List<NavigationBarr> showNav() {
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

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    public boolean UpdateNav(String name, int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update NavMenu set Name = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean UpdateCatalog(String name, int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Catalog set Name = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    public boolean DeleteNav(int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Delete from NavMenu where Id like " + id + "";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("DeleteNav(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean DeleteCatalog(int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Delete from Catalog where Id like " + id + "";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("DeleteCatalog(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    public boolean InsertNav(String name) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into NavMenu values(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("InsertNav(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean InsertCatalog(String name, int navid) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into Catalog values(?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setInt(2, navid);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("InsertCatalog(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
