/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package trungtin.cart;

import java.util.HashMap;
import java.util.Map;
import trungtin.product.ProductDTO;

/**
 *
 * @author User
 */
public class Cart {

    private Map<String, CartDTO> cart;
    private double total;
    private int size = 0;

    public Cart(Map<String, CartDTO> cart, double total) {
        this.cart = cart;
        this.total = total;
    }

    public Cart() {
    }

    public double getTotal() {
        return total;
    }

    public int getSize() {
        int result = 0;
        for (CartDTO value : cart.values()) {
            result += value.getQuantity();
        }
        return result;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Map<String, CartDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, CartDTO> cart) {
        this.cart = cart;
    }

    public boolean add(CartDTO product) {
        boolean check = false;
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(product.getProductID())) {
            int currentQuantity = this.cart.get(product.getProductID()).getQuantity();
            product.setQuantity(currentQuantity + product.getQuantity());
        }
        cart.put(product.getProductID(), product);
        check = true;
        return check;
    }

    public boolean delete(String id) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }

    public boolean update(String id, CartDTO nProduct) {
        boolean check = false;
        if (this.cart != null) {
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, nProduct);
                check = true;
            }
        }
        return check;
    }
}
