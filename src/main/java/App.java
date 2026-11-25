import models.Product;
import models.Role;
import models.User;
import org.mindrot.jbcrypt.BCrypt;
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

        String hash = BCrypt.hashpw("password", BCrypt.gensalt(12));
        System.out.println(hash);
        System.out.println(userDao.insert(new User(0, "John Doe", "john.doe@example.com", "password", Role.USER)));
        System.out.println(userDao.insert(new User(0, "Aguilar", "aguilar@example.com", "password", Role.ADMIN)));
        System.out.println(userDao.insert(new User(0, "User", "user@example.com", "password", Role.USER)));
        System.out.println(userDao.findByEmail("john.doe@example.com"));


    }

}
