/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.io.Serializable;
import model.Products;

/**
 *
 * @author tanks
 */
public class ProductDTO implements Serializable{
    
    private Products sanpham;
    private int quantity;

    public ProductDTO() {
    }

    public ProductDTO(Products sanpham) {
        this.sanpham = sanpham;
        this.quantity = 1;
    }

    public Products getSanpham() {
        return sanpham;
    }

    public void setSanpham(Products sanpham) {
        this.sanpham = sanpham;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
    
}
