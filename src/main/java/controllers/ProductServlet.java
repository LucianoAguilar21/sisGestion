package controllers;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Product;
import persistence.commons.DaoFactory;
import persistence.dao.ProductDao;
import services.ProductService;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet("/products")
public class ProductServlet  extends HttpServlet {

    private ProductService productService;

    @Override
    public void init() throws ServletException {
        super.init();
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<Product> products = (ArrayList<Product>) productService.findAllProducts();

        req.setAttribute("pageTitle", "Productos");
        req.setAttribute("products", products);


        req.setAttribute(
                "contentPage",
                "/WEB-INF/views/products/products.jsp"
        );

        req.getRequestDispatcher(
                "/WEB-INF/views/layouts/main.jsp"
        ).forward(req, resp);
    }
}
