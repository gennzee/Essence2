/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author tanks
 */
public class OrderDetail {
    private int id;
    private int quantity;
    private int orderid;
    private int productid;
    private int price;

    public OrderDetail() {
    }

    public OrderDetail(int id, int quantity, int orderid, int productid, int price) {
        this.id = id;
        this.quantity = quantity;
        this.orderid = orderid;
        this.productid = productid;
        this.price = price;
    }

    public OrderDetail(int quantity, int orderid, int productid, int price) {
        this.quantity = quantity;
        this.orderid = orderid;
        this.productid = productid;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }


    
    
    
}
