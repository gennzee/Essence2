/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nxanh
 */
public class Users {

    private String id;
    private String username;
    private String password;
    private String name;
    private String email;
    private int roleid;
    private String imageuser;
    private String phone;
    private String address;
    private String createddate;

    public Users() {
    }

    public Users(String id, String username, String password, String name, String email, int roleid, String imageuser, String phone, String address, String createddate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.roleid = roleid;
        this.imageuser = imageuser;
        this.phone = phone;
        this.address = address;
        this.createddate = createddate;
    }

    public Users(String username, String password, String name, String email, String imageuser, String phone, String address, String createddate) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.imageuser = imageuser;
        this.phone = phone;
        this.address = address;
        this.createddate = createddate;
    }

    public Users(String id, String name, String email, String imageuser, String phone, String address) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.imageuser = imageuser;
        this.phone = phone;
        this.address = address;
    }

    public Users(String username, String password, String name, String email, int roleid, String imageuser, String phone, String address) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.roleid = roleid;
        this.imageuser = imageuser;
        this.phone = phone;
        this.address = address;
    }

    public Users(String username, String password, String name, String email, int roleid, String phone, String address) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.roleid = roleid;
        this.phone = phone;
        this.address = address;
    }

    public Users(String username, String name, String email, int roleid, String imageuser, String phone, String address) {
        this.username = username;
        this.name = name;
        this.email = email;
        this.roleid = roleid;
        this.imageuser = imageuser;
        this.phone = phone;
        this.address = address;
    }

    public Users(String username, String name, String email, int roleid, String phone, String address) {
        this.username = username;
        this.name = name;
        this.email = email;
        this.roleid = roleid;
        this.phone = phone;
        this.address = address;
    }

    public Users(String username, String password, String name, String email, int roleid, String imageuser, String phone, String address, String createddate) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.email = email;
        this.roleid = roleid;
        this.imageuser = imageuser;
        this.phone = phone;
        this.address = address;
        this.createddate = createddate;
    }
    
    
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public String getImageuser() {
        return imageuser;
    }

    public void setImageuser(String imageuser) {
        this.imageuser = imageuser;
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

    public String getCreateddate() {
        return createddate;
    }

    public void setCreateddate(String createddate) {
        this.createddate = createddate;
    }

}
