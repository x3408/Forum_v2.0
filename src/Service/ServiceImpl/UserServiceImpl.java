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

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
