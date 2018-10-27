/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.util.HashMap;

/**
 *
 * @author tanks
 */
public class CartBean extends HashMap<Integer, ProductDTO> {

    public void addSanPham(ProductDTO sanpham) {
        int key = sanpham.getSanpham().getId();
        if (this.containsKey(key)) {
            int oldQuantity = ((ProductDTO) this.get(key)).getQuantity();
            ((ProductDTO) this.get(key)).setQuantity(oldQuantity + 1);
        } else {
            this.put(sanpham.getSanpham().getId(), sanpham);
        }
    }

    public boolean removeSanpham(int id) {
        if (this.containsKey(id)) {
            this.remove(id);
            return true;
        }
        return false;
    }

    public CartBean() {
        super();
    }
}
