package persistence.commons;

import persistence.dao.ProductDao;
import persistence.dao.UserDao;
import persistence.implDao.ProductDaoImpl;
import persistence.implDao.UserDaoImpl;

public class DaoFactory {

    public static ProductDao getProductDao() {
        return new ProductDaoImpl();
    }

    public static UserDao getUserDao() {
        return new UserDaoImpl();
    }

}
