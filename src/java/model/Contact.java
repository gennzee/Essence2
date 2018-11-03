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
public class Contact {
    private int id;
    private String googlemap;
    private String title;
    private String content;
    private String address;
    private String phone;
    private String email;

    public Contact() {
    }

    public Contact(int id, String googlemap, String title, String content, String address, String phone, String email) {
        this.id = id;
        this.googlemap = googlemap;
        this.title = title;
        this.content = content;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public Contact(String googlemap, String title, String content, String address, String phone, String email) {
        this.googlemap = googlemap;
        this.title = title;
        this.content = content;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGooglemap() {
        return googlemap;
    }

    public void setGooglemap(String googlemap) {
        this.googlemap = googlemap;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
    
}
