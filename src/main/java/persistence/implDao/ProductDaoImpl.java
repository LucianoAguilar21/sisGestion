package persistence.implDao;

import models.Product;
import models.nullObjects.NullProduct;
import persistence.commons.ConnectionProvider;
import persistence.commons.MissingDataException;
import persistence.dao.ProductDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    @Override
    public Product findbyID(Integer id) {
        try {
            String sql = "SELECT * FROM products WHERE id = ?";
            Connection conn = ConnectionProvider.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            Product p = NullProduct.build();
            if (rs.next()) {
                p = new Product(rs.getInt("id"), rs.getString("name"),  rs.getDouble("price"), rs.getInt("stock"));
            }
            return p;

        } catch (SQLException e) {
            throw new MissingDataException(e);
        }
    }

    @Override
    public List<Product> findAll() {
        try {
            String sql = "SELECT * FROM products";
            Connection conn = ConnectionProvider.getConnection();

            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            ArrayList<Product> products = new ArrayList<Product>();

            while (rs.next()) {
                products.add(new Product(rs.getInt("id"), rs.getString("name"),  rs.getDouble("price"), rs.getInt("stock")));
            }
            return products;

        } catch (SQLException e) {
            throw new MissingDataException(e);
        }
    }

    @Override
    public int countAll() {
        return 0;
    }

    @Override
    public int insert(Product product) {
        return 0;
    }

    @Override
    public int update(Product product) {
        return 0;
    }

    @Override
    public int delete(Product product) {
        return 0;
    }
}
