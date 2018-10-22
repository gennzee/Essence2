/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.NavigationBar;

/**
 *
 * @author tanks
 */
public class NavigationBarDAO {

    public NavigationBarDAO() {
    }

    public List<NavigationBar> showNav(String idd) {
        try {
            Connection conn = DBConnection.getConn();
            String sql = "select NavMenu.Id as NavMenuID, Catalog.Id as CatalogID, NavMenu.Name as NavMenuName, Catalog.Name as CatalogName\n"
                    + "from Catalog\n"
                    + "inner join NavMenu on NavMenu.Id = Catalog.NavID\n"
                    + "where NavMenu.Id like '" + idd + "'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            List<NavigationBar> list = new ArrayList<NavigationBar>();
            while (rs.next()) {
                int navmenuid = rs.getInt(1);
                int catalogmenuid = rs.getInt(2);
                String navmenuname = rs.getString(3);
                String catalogmenuname = rs.getString(4);
                NavigationBar a = new NavigationBar(navmenuid, catalogmenuid, navmenuname, catalogmenuname);
                list.add(a);
            }
            return list;
        } catch (Exception e) {
            System.out.println("showNav(DAO)");
            e.printStackTrace();
        }
        return null;
    }
}
