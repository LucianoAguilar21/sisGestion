import models.Product;
import models.User;
import persistence.commons.ConnectionProvider;
import persistence.commons.DaoFactory;
import persistence.dao.ProductDao;
import persistence.dao.UserDao;

public class App {

    public static void main(String[] args) {

        ProductDao productDao = DaoFactory.getProductDao();
        UserDao userDao = DaoFactory.getUserDao();

        Product p = productDao.findbyID(1);

        System.out.println(p);


        System.out.println("---------------------");

        System.out.println(productDao.findAll());

        System.out.println("---------------------");

        System.out.println(userDao.insert(new User(0, "John Doe", "john.doe@example.com", "password", "user")));


        System.out.println(userDao.findByEmail("john.doe@example.com"));


    }

}
