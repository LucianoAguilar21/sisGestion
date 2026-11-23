package persistence.dao;

import models.User;
import persistence.commons.GenericDao;

public interface UserDao extends GenericDao<User> {

    public User findByEmail(String email);

    public boolean userExists(String email);

}
