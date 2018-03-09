package Service.ServiceImpl;

import Bean.User;
import Dao.UserDao;
import Service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao;
    @Override
    public User login(User user) {
        return userDao.findByPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public void add(User user) {
        userDao.addUser(user);
    }

    @Override
    public void follow(User user, String follow_id) {
        userDao.follow(user.getUid(), follow_id);
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
