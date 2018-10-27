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
public class Orders {
    private int id;
    private int total;
    private String orderdate;
    private String name;
    private String phone;
    private String address;
    private String note;
    private int userid;
    private int shipperid;
    private int paymentstatus;

    public Orders() {
    }

    public Orders(int id, int total, String orderdate, String name, String phone, String address, String note, int userid, int shipperid, int paymentstatus) {
        this.id = id;
        this.total = total;
        this.orderdate = orderdate;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.userid = userid;
        this.shipperid = shipperid;
        this.paymentstatus = paymentstatus;
    }

    public Orders(int total, String orderdate, String name, String phone, String address, String note, int userid, int shipperid, int paymentstatus) {
        this.total = total;
        this.orderdate = orderdate;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.userid = userid;
        this.shipperid = shipperid;
        this.paymentstatus = paymentstatus;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(String orderdate) {
        this.orderdate = orderdate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getShipperid() {
        return shipperid;
    }

    public void setShipperid(int shipperid) {
        this.shipperid = shipperid;
    }

    public int getPaymentstatus() {
        return paymentstatus;
    }

    public void setPaymentstatus(int paymentstatus) {
        this.paymentstatus = paymentstatus;
    }
    
    
    
}
