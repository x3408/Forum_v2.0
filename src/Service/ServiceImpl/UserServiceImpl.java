package Service.ServiceImpl;

import Bean.User;
import Dao.UserDao;
import Service.UserService;
import Util.UserBean;

public class UserServiceImpl implements UserService {
    private UserDao userDao;
    private UserBean userBean;
    @Override
    public User login(User user) {
        return userDao.findByPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public void add(User user) {
        user.setHeadPortrait("default.jpg");
        userDao.addUser(user);
    }

    @Override
    public void follow(User user, String follow_id) {
        userDao.follow(user.getUid(), follow_id);
    }

    @Override
    public void unFollow(User user, String follow_id) {
        userDao.unFollow(user.getUid(),follow_id);
    }

    @Override
    public User findUserById(String showUserId) {
        User user = userDao.findUserById(showUserId);
        return user;
    }

    @Override
    public boolean checkUser(String username) {
        User u = userDao.findUserByUsername(username);
        if (u != null)
            return true;
        return false;
    }

    @Override
    public Integer findFansCount(User user) {
        userDao.findFansCount(user.getUid());
        return null;
    }

    @Override
    public UserBean findUserByKeyword(String keyword, Integer page) {
        return userBean.showUserByKeyword(page, keyword);
    }

    @Override
    public Boolean checkStatus(String uid, String uid1) {
        return userDao.checkStatus(uid, uid1);
    }


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void setUserBean(UserBean userBean) {
        this.userBean = userBean;
    }
}
