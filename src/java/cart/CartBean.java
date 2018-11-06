/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

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

    public boolean updateQuantity(int key, int quantity) {
        if (this.containsKey(key)) {
            if (this.get(key).getQuantity() >= 1) {
                this.get(key).setQuantity(quantity);
                if (this.get(key).getQuantity() == 0) {
                    removeSanpham(key);
                }
            }
            return true;
        }
        return false;
    }

    public void clearCart() {
        this.clear();
    }

    public int countItem() { // đếm lượng hàng trong Giỏ
        int count = 0;
        count = this.size();
        return count;
    }

    public int countQuantity() {
        int slQuantity = 0;
        Set set = this.entrySet();
        Iterator iterator = set.iterator();
        while (iterator.hasNext()) {
            Map.Entry mentry = (Map.Entry) iterator.next();
            int Quantity = ((ProductDTO) mentry.getValue()).getQuantity();
            slQuantity += Quantity;
        }
        return slQuantity;
    }

    public CartBean() {
        super();
    }
}
