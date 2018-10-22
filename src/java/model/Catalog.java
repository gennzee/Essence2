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
public class Catalog {
    private int id;
    private String name;
    private int navid;

    public Catalog() {
    }

    public Catalog(int id, String name, int navid) {
        this.id = id;
        this.name = name;
        this.navid = navid;
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

    public int getNavid() {
        return navid;
    }

    public void setNavid(int navid) {
        this.navid = navid;
    }

    
    
}
