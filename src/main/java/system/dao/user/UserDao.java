package system.dao.user;

import system.model.User;

public interface UserDao {
    void enter(User user);
    User getById(int id);
}
