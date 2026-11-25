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
        if (email == null || pass == null) {
            return NullUser.build();
        }

        String emailLower = email.trim().toLowerCase();

        User usuario = DaoFactory.getUserDao()
                .findByEmail(emailLower);

        if (usuario == null || usuario.isNull()
                || !usuario.checkPassword(pass)) {

            return NullUser.build();
        }

        return usuario;

    }

    public boolean userExists(String email) {
        return DaoFactory.getUserDao().userExists(email);
    }




}
