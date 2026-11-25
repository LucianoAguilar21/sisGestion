package services;

import models.Product;
import models.User;
import persistence.commons.DaoFactory;

import java.util.List;

public class ProductService {


    public Product findProductById(Integer id) {
        return DaoFactory.getProductDao().findbyID(id);
    }

    public List<Product> findAllProducts() {
        return DaoFactory.getProductDao().findAll();
    }


}
