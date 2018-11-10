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
    private String username;
    private String userphone;
    private String shippername;
    private String paymentstatusname;
    private String shipperphone;

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

    public Orders(int id, int total, String orderdate, String name, String phone, String address, String note, String username, String userphone, String shippername, String paymentstatusname, String shipperphone) {
        this.id = id;
        this.total = total;
        this.orderdate = orderdate;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.username = username;
        this.userphone = userphone;
        this.shippername = shippername;
        this.paymentstatusname = paymentstatusname;
        this.shipperphone = shipperphone;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public String getShippername() {
        return shippername;
    }

    public void setShippername(String shippername) {
        this.shippername = shippername;
    }

    public String getPaymentstatusname() {
        return paymentstatusname;
    }

    public void setPaymentstatusname(String paymentstatusname) {
        this.paymentstatusname = paymentstatusname;
    }

    public String getShipperphone() {
        return shipperphone;
    }

    public void setShipperphone(String shipperphone) {
        this.shipperphone = shipperphone;
    }
    
    

    
    
    
}
