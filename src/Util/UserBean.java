package Util;

import Bean.User;
import Dao.UserDao;

import java.util.List;

public class UserBean {
    //当前页数
    private Integer page;
    //每次动态添加几条数据数
    private Integer limit;
    //总记录数
    private Integer totalCount;
    //总页数
    private Integer totalPage;

    private List<User> list;

    private UserDao userDao;

    private String keyword;

    public UserBean showUserByKeyword(Integer page, String keyword) {
        this.page = page;
        this.keyword = keyword;
        if (limit == null) {
            this.limit = 6;
        }

        int start = (page - 1) * limit;

        totalCount = userDao.getTotalCountByName(keyword);

        if (totalCount % limit == 0)
            totalPage = totalCount / limit;
        else
            totalPage = totalCount / limit + 1;

        list = userDao.getUserByName(start, limit, keyword);

        return this;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public List<User> getList() {
        return list;
    }
}
