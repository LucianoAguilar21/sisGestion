package models.nullObjects;

import models.Product;

public class NullProduct extends Product {

    public static Product build(){
        Product p = null;
        try {
            p = new NullProduct();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public NullProduct() {
        super(0, "No product", 0.0, 0);
    }

    public boolean isNull() {
        return true;
    }
}
