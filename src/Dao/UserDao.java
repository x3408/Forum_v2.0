package Dao;

import Bean.User;

public interface UserDao {
    User findByPassword(String username, String password);

    Boolean addUser(User user);
}
