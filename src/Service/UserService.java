package Service;

import Bean.User;

public interface UserService {
    User login(User user);

    void add(User user);
}
