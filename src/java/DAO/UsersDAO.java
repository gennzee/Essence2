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
import model.Users;

/**
 *
 * @author tanks
 */
public class UsersDAO {

    public UsersDAO() {
    }

    public String Login(String username, String password) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Users where Username like ? and Password like ? and isActive = 1";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
//                String usernameDB = rs.getString(1);
//                String passwordDB = rs.getString(2);
//                String fullnameDB = rs.getString(3);
                int roleDB = rs.getInt(6);
                if (roleDB == 1) {
                    return "admin";
                } else if (roleDB == 2) {
                    return "nhanvien";
                } else {
                    return "guest";
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return "false";
    }

    public List<Users> showUsers(String usernamee) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Users where Username like '" + usernamee + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Users> list = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString(1);
                String username = rs.getString(2);
                String pass = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                int roleid = rs.getInt(6);
                String imageuser = rs.getString(7);
                String phone = rs.getString(8);
                String address = rs.getString(9);
                String createddate = rs.getString(10);
                Users a = new Users(id, username, pass, name, email, roleid, imageuser, phone, address, createddate);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showUsers(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    //validation username
    public boolean showUsers_validation(String usernamee) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Users where Username like '" + usernamee + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("showUsers_validation(DAO)");
            e.printStackTrace();
        }
        return true;
    }

    //validation email
    public boolean showEmails_validation(String email) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Users where Email like '" + email + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("showEmails_validation(DAO)");
            e.printStackTrace();
        }
        return true;
    }

    //validation product
    public boolean showProducts_validation(String product_name) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select * from Product where Name like '" + product_name + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("showProducts_validation(DAO)");
            e.printStackTrace();
        }
        return true;
    }

    public List<Users> showList_users_admin(int isActive) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "  select * from Users where RoleID = 2 and isActive = " + isActive + "";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<Users> list = new ArrayList<Users>();
            while (rs.next()) {
                String id = rs.getString(1);
                String username = rs.getString(2);
                String pass = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                int roleid = rs.getInt(6);
                String imageuser = rs.getString(7);
                String phone = rs.getString(8);
                String address = rs.getString(9);
                String createddate = rs.getString(10);
                Users a = new Users(id, username, pass, name, email, roleid, imageuser, phone, address, createddate);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showList_users_admin(DAO)");
            e.printStackTrace();
        }
        return null;
    }

    public boolean Insert(Users users) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Insert into Users values(?,?,?,?,?,?,?,?,?,1)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getUsername());
            ps.setString(2, users.getPassword());
            ps.setString(3, users.getName());
            ps.setString(4, users.getEmail());
            ps.setInt(5, 3);
            ps.setString(6, users.getImageuser());
            ps.setString(7, users.getPhone());
            ps.setString(8, users.getAddress());
            ps.setString(9, users.getCreateddate());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("insertUSER(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean Insert_with_admin_page(Users users) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Insert into Users values(?,?,?,?,?,?,?,?,?,1)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getUsername());
            ps.setString(2, users.getPassword());
            ps.setString(3, users.getName());
            ps.setString(4, users.getEmail());
            ps.setInt(5, users.getRoleid());
            ps.setString(6, users.getImageuser());
            ps.setString(7, users.getPhone());
            ps.setString(8, users.getAddress());
            ps.setString(9, users.getCreateddate());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("insertUSER(DAO)");
            e.printStackTrace();
        }
        return false;
    }

    public boolean Update(Users users) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Users set Name = ?, Email = ?, ImageUser = ?, Phone = ?, Address = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getImageuser());
            ps.setString(4, users.getPhone());
            ps.setString(5, users.getAddress());
            ps.setString(6, users.getId());
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Update_user_with_password_and_image_is_not_null(Users users, String id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Users set Name = ?, Email = ?, ImageUser = ?, Phone = ?, Address = ?, Password = ?, RoleID = ?, Username = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getImageuser());
            ps.setString(4, users.getPhone());
            ps.setString(5, users.getAddress());
            ps.setString(6, users.getPassword());
            ps.setInt(7, users.getRoleid());
            ps.setString(8, users.getUsername());
            ps.setString(9, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Update_user_with_image_is_null(Users users, String id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Users set Name = ?, Email = ?, Phone = ?, Address = ?, Password = ?, RoleID = ?, Username = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getPhone());
            ps.setString(4, users.getAddress());
            ps.setString(5, users.getPassword());
            ps.setInt(6, users.getRoleid());
            ps.setString(7, users.getUsername());
            ps.setString(8, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Update_user_with_password_is_null(Users users, String id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Users set Name = ?, Email = ?, ImageUser = ?, Phone = ?, Address = ?, RoleID = ?, Username = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getImageuser());
            ps.setString(4, users.getPhone());
            ps.setString(5, users.getAddress());
            ps.setInt(6, users.getRoleid());
            ps.setString(7, users.getUsername());
            ps.setString(8, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean Update_user_with_password_and_image_is_null(Users users, String id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "update Users set Name = ?, Email = ?, Phone = ?, Address = ?, RoleID = ?, Username = ? where Id = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, users.getName());
            ps.setString(2, users.getEmail());
            ps.setString(3, users.getPhone());
            ps.setString(4, users.getAddress());
            ps.setInt(5, users.getRoleid());
            ps.setString(6, users.getUsername());
            ps.setString(7, id);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public boolean isExitEmail(String username, String email) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Select * from Users where Username = ? and Email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }

    public void getPassword(String password, String email) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Update Users set Password = ? where Username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            int rs = ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public boolean UpdatePass(String username, String password) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Update Users set Password = ? where Username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            int rs = ps.executeUpdate();
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean Delete(int isActive, int id) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "Update Users set isActive = " + isActive + " where Id = " + id + "";
            Statement st = conn.createStatement();
            int rs = st.executeUpdate(sql);
            if (rs > 0) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("DeleteUsers(DAO)");
            e.printStackTrace();
        }
        return false;
    }
}
