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
public class ShipperWithOrder {
    private int orderid;
    private int shipperid;
    private String shippername;
    private String shipperphone;
    private String shippercompany;
    private int paymentstatus;

    public ShipperWithOrder() {
    }

    public ShipperWithOrder(int orderid, int shipperid, String shippername, String shipperphone, String shippercompany, int paymentstatus) {
        this.orderid = orderid;
        this.shipperid = shipperid;
        this.shippername = shippername;
        this.shipperphone = shipperphone;
        this.shippercompany = shippercompany;
        this.paymentstatus = paymentstatus;
    }

    public int getOrderid() {
        return orderid;
    }

    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }

    public int getShipperid() {
        return shipperid;
    }

    public void setShipperid(int shipperid) {
        this.shipperid = shipperid;
    }

    public String getShippername() {
        return shippername;
    }

    public void setShippername(String shippername) {
        this.shippername = shippername;
    }

    public String getShipperphone() {
        return shipperphone;
    }

    public void setShipperphone(String shipperphone) {
        this.shipperphone = shipperphone;
    }

    public String getShippercompany() {
        return shippercompany;
    }

    public void setShippercompany(String shippercompany) {
        this.shippercompany = shippercompany;
    }

    public int getPaymentstatus() {
        return paymentstatus;
    }

    public void setPaymentstatus(int paymentstatus) {
        this.paymentstatus = paymentstatus;
    }

    
    
    
    
    
    
}
