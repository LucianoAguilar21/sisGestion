package models;
import org.mindrot.jbcrypt.BCrypt;

public class User {

    private int id;
    private String name;
    private String email;
    private String passwordHash;
    private String rol;


    public User(int id, String name, String email, String passwordHash, String rol) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.setPasswordHash(passwordHash);
        this.rol = rol;
    }


    public boolean checkPassword(String password) {
        return BCrypt.checkpw(password, this.passwordHash);
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = BCrypt.hashpw(passwordHash, BCrypt.gensalt(12));
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isNull() {
        return false;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", passwordHash='" + passwordHash + '\'' +
                ", rol='" + rol + '\'' +
                '}';
    }
}
