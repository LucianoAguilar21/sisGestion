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

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet("/products")
public class ProductServlet  extends HttpServlet {

    private ProductDao productDao;

    @Override
    public void init() throws ServletException {
        super.init();
        productDao = DaoFactory.getProductDao();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<Product> products = (ArrayList<Product>) productDao.findAll();

        req.setAttribute("products", products);

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/products/products.jsp");
        dispatcher.forward(req, resp);
    }
}
