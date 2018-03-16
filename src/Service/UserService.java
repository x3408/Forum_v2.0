package Service;

import Bean.User;

public interface UserService {
    User login(User user);

    void add(User user);

    void follow(User user, String follow_id);

    User findUserById(String showUserId);

    boolean checkUser(String username);

    Integer findFansCount(User user);
}
