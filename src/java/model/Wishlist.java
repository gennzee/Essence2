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
public class Wishlist {

    private int id;
    private int userid;
    private int productid;
    private String productname;
    private String productbrand;
    private int productdiscount;
    private int productprice;
    
    
    public Wishlist() {
    }

    public Wishlist(int userid, int productid) {
        this.userid = userid;
        this.productid = productid;
    }

    public Wishlist(int id, int userid, int productid, String productname, String productbrand, int productdiscount, int productprice) {
        this.id = id;
        this.userid = userid;
        this.productid = productid;
        this.productname = productname;
        this.productbrand = productbrand;
        this.productdiscount = productdiscount;
        this.productprice = productprice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductbrand() {
        return productbrand;
    }

    public void setProductbrand(String productbrand) {
        this.productbrand = productbrand;
    }

    public int getProductdiscount() {
        return productdiscount;
    }

    public void setProductdiscount(int productdiscount) {
        this.productdiscount = productdiscount;
    }

    public int getProductprice() {
        return productprice;
    }

    public void setProductprice(int productprice) {
        this.productprice = productprice;
    }
    
    
    
}
