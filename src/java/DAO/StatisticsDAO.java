/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Genn
 */
public class StatisticsDAO {

    public String show_orders_in_month(String date) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select count(Id) as count_orders\n"
                    + "from Orders\n"
                    + "where OrderDate like '%" + date + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                String count_orders = rs.getString(1);
                return count_orders;
            }
        } catch (Exception e) {
            System.out.println("show_order_by_date(statisticDAO)");
        }
        return "false";
    }

    public String show_collections_in_month(String date) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select count(Id) as count_collections\n"
                    + "from News\n"
                    + "where CreatedDate like '%" + date + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                String count_collections = rs.getString(1);
                return count_collections;
            }
        } catch (Exception e) {
            System.out.println("show_collections_in_month(statisticDAO)");
        }
        return "false";
    }

    public String show_created_customers_in_month(String date) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select count(Id) as count_customers\n"
                    + "from Users\n"
                    + "where RoleID = 3 and CreatedDate like '%" + date + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                String count_customers = rs.getString(1);
                return count_customers;
            }
        } catch (Exception e) {
            System.out.println("show_created_customers_in_month(statisticDAO)");
        }
        return "false";
    }

    public String show_orders_status_in_month(String date, int paymentId) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select count(Id) as count_orders\n"
                    + "from Orders\n"
                    + "where OrderDate like '%" + date + "%' and PaymentStsID = " + paymentId + " ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                String count_orders_delivered = rs.getString(1);
                return count_orders_delivered;
            }
        } catch (Exception e) {
            System.out.println("show_orders_status_in_month(statisticDAO)");
        }
        return "false";
    }

    public int show_revenue_in_month(String date, int paymentId) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select sum(Total) as sum_revenue\n"
                    + "from Orders\n"
                    + "where OrderDate like '%" + date + "%' and PaymentStsID = " + paymentId + " ";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                int sum_revenue = rs.getInt(1);
                return sum_revenue;
            }
        } catch (Exception e) {
            System.out.println("show_revenue_in_month(statisticDAO)");
        }
        return 0;
    }
}
