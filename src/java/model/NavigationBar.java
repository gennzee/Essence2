/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashSet;
import java.util.Set;


/**
 *
 * @author tanks
 */
public class NavigationBar {

    private int navmenuid;
    private int catalogmenuid;
    private String navmenuname;
    private String catalogmenuname;

    public NavigationBar() {
    }

    public NavigationBar(int navmenuid, int catalogmenuid, String navmenuname, String catalogmenuname) {
        this.navmenuid = navmenuid;
        this.catalogmenuid = catalogmenuid;
        this.navmenuname = navmenuname;
        this.catalogmenuname = catalogmenuname;
    }

    public int getNavmenuid() {
        return navmenuid;
    }

    public void setNavmenuid(int navmenuid) {
        this.navmenuid = navmenuid;
    }

    public int getCatalogmenuid() {
        return catalogmenuid;
    }

    public void setCatalogmenuid(int catalogmenuid) {
        this.catalogmenuid = catalogmenuid;
    }

    public String getNavmenuname() {
        return navmenuname;
    }

    public void setNavmenuname(String navmenuname) {
        this.navmenuname = navmenuname;
    }

    public String getCatalogmenuname() {
        return catalogmenuname;
    }

    public void setCatalogmenuname(String catalogmenuname) {
        this.catalogmenuname = catalogmenuname;
    }

    

    

}
