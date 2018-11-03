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
import model.News;

/**
 *
 * @author tanks
 */
public class NewsDAO {

    public NewsDAO() {
    }

    public List<News> showListNews() {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from News";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<News> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String createdby = rs.getString(4);
                String editedby = rs.getString(5);
                String createddate = rs.getString(6);
                String editeddate = rs.getString(7);
                String imagetitle = rs.getString(8);
                News a = new News(id, title, content, createdby, editedby, createddate, editeddate, imagetitle);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showListNews(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public List<News> show_single_news(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from News where Id = '" + idd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<News> list = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String createdby = rs.getString(4);
                String editedby = rs.getString(5);
                String createddate = rs.getString(6);
                String editeddate = rs.getString(7);
                String imagetitle = rs.getString(8);
                News a = new News(id, title, content, createdby, editedby, createddate, editeddate, imagetitle);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("show_single_news(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public boolean add_news(String title, String content, String createdby, String createddate, String imagetitle) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "insert into news(Title,Content,CreatedBy,CreatedDate,ImageTitle) values(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, createdby);
            ps.setString(4, createddate);
            ps.setString(5, imagetitle);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("add_news(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean Update_news(String title, String img, String content, String editby, String editdate, int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update News set Title = ?, Content = ?, ImageTitle = ?, Editedby = ?, EditedDate = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, img);
            ps.setString(4, editby);
            ps.setString(5, editdate);
            ps.setInt(6, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Delete_news(int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Delete from News where Id like " + id + "";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Delete_news(DAO)");
            e.printStackTrace();
        }
        return false;
    }

}
