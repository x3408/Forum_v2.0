package Dao;

import Bean.User;

import java.util.List;

public interface UserDao {
    User findByPassword(String username, String password);

    void addUser(User user);

    void follow(String uid, String follow_id);

    User findUserById(String showUserId);

    User findUserByUsername(String username);

    Integer findFansCount(String uid);

    List<User> findUserByKeyword(String keyword);

    Integer getTotalCountByName(String keyword);

    List<User> getUserByName(int start, Integer limit, String keyword);
}
