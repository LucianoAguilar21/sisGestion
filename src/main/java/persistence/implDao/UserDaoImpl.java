package persistence.implDao;

import models.Role;
import models.User;
import models.nullObjects.NullUser;
import persistence.commons.ConnectionProvider;
import persistence.commons.MissingDataException;
import persistence.dao.UserDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDaoImpl implements UserDao {
    @Override
    public User findByEmail(String email) {
        try {
            String sql = "SELECT * FROM users WHERE email = ?";
            Connection conn = ConnectionProvider.getConnection();

            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            User u = NullUser.build();
            if (rs.next()) {
                u = new User(rs.getInt("id"), rs.getString("name"), rs.getString("email"), rs.getString("password_hash"), Role.valueOf(rs.getString("rol").toUpperCase()));
            }
            return u;

        } catch (SQLException e) {
            throw new MissingDataException(e);
        }
    }

    @Override
    public boolean userExists(String email) {
        try {
            String sql = "SELECT * FROM users WHERE email = ?";
            Connection conn = ConnectionProvider.getConnection();

            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();

            return rs.next();

        } catch (SQLException e) {
            throw new MissingDataException(e);
        }
    }

    @Override
    public User findbyID(Integer id) {
        return null;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public int countAll() {
        return 0;
    }

    @Override
    public int insert(User user) {
        try {
            String sql = "INSERT INTO users (name, email, password_hash, rol) VALUES (?, ?, ?, ?)";
            Connection conn = ConnectionProvider.getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPasswordHash());
            st.setString(4, user.getRole().getRoleName());

            int resultado = 0;
            if(!userExists(user.getEmail())) {
                resultado = st.executeUpdate();
            }
            return resultado;

        } catch (SQLException e) {
            throw new MissingDataException(e);
        }
    }

    @Override
    public int update(User user) {
        return 0;
    }

    @Override
    public int delete(User user) {
        return 0;
    }
}
