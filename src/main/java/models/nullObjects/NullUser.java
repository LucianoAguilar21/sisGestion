package models.nullObjects;

import models.User;

public class NullUser extends User {

    public static User build() {
        User u = null;
        try {
            u = new NullUser();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public NullUser()  {
        super(0, "", "", "", "");
    }

    public boolean isNull() {
        return true;
    }

}
