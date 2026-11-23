package services;

import models.User;
import models.nullObjects.NullUser;
import persistence.commons.DaoFactory;

import java.util.List;

public class UserService {

    public User findUserByEmail(String email) {
        return DaoFactory.getUserDao().findByEmail(email);
    }

    public User login(String email, String pass) {
        String emailLower = email.toLowerCase();
        User usuario = DaoFactory.getUserDao().findByEmail(emailLower);
        if (usuario.isNull() || !usuario.checkPassword(pass)) {
            usuario = NullUser.build();
        }
        return usuario;

    }

    public boolean userExists(String email) {
        return DaoFactory.getUserDao().userExists(email);
    }




}
