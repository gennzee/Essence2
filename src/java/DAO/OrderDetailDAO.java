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
import model.OrderDetail;
import model.OrderDetailWithId;
import model.ShipperWithOrder;

/**
 *
 * @author tanks
 */
public class OrderDetailDAO {
    
    public OrderDetailDAO() {
    }
    
    public List<OrderDetailWithId> listOrderDetail(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select OrderDetail.OrderID, Product.Id, Product.Name, OrderDetail.Quantity, Product.Discount, Product.Price\n"
                    + "from OrderDetail\n"
                    + "inner join Product on OrderDetail.ProductID = Product.Id\n"
                    + "where OrderID = " + idd + "";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<OrderDetailWithId> list = new ArrayList<>();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                int id = rs.getInt(2);
                String name = rs.getString(3);
                int quantity = rs.getInt(4);
                int discount = rs.getInt(5);
                int price = rs.getInt(6);
                OrderDetailWithId a = new OrderDetailWithId(orderid, id, name, quantity, discount, price);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("listOrderDetail(DAO)");
            e.printStackTrace();
        }
        return null;
    }
    
    public List<ShipperWithOrder> get_shipper(int idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select OrderDetail.OrderID, Shipper.*, Orders.PaymentStsID\n"
                    + "from Orders\n"
                    + "inner join OrderDetail on Orders.Id = OrderDetail.OrderID\n"
                    + "inner join Shipper on Shipper.Id = Orders.ShipperID\n"
                    + "where OrderID = '" + idd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<ShipperWithOrder> list = new ArrayList<>();
            while (rs.next()) {
                int orderid = rs.getInt(1);
                int shipperid = rs.getInt(2);
                String shippername = rs.getString(3);
                String shipperphone = rs.getString(4);
                int paymentstatus = rs.getInt(5);
                ShipperWithOrder a = new ShipperWithOrder(orderid, shipperid, shippername, shipperphone, paymentstatus);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("get_shipper(DAO)");
            e.printStackTrace();
        }
        return null;
    }
    
}
