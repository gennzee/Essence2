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

import java.sql.Date;

public class Products {
    private int id;
    private String name;
    private String detail;
    private int price;
    private int discount;
    private int quantity;
    private String brand;
    private String img1;
    private String img2;
    private int catalogid;

    public Products() {
    }

    public Products(int id, String name, String detail, int price, int discount, int quantity, String brand, String img1, String img2, int catalogid) {
        this.id = id;
        this.name = name;
        this.detail = detail;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.brand = brand;
        this.img1 = img1;
        this.img2 = img2;
        this.catalogid = catalogid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }


    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public int getCatalogid() {
        return catalogid;
    }

    public void setCatalogid(int catalogid) {
        this.catalogid = catalogid;
    }


    
    
    
}
