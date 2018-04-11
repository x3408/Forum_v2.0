package Util;

import Bean.Message;
import Bean.User;
import Dao.PersonDao;

import java.util.List;

public class MessageBean {
    //当前页数
    private Integer page;
    //每次动态添加几条数据数
    private Integer limit;

    private List<Message> list;

    private PersonDao personDao;

    public MessageBean showMessageTitle(Integer page, User user) {
        this.page = page;

        if (limit == null) {
            this.limit = 3;
        }

        int start = (page - 1) * limit;

        list = personDao.getMessageTitleByUser(start, limit, user.getUid());

        return this;
    }

    public List<Message> getList() {
        return list;
    }

    public void setList(List<Message> list) {
        this.list = list;
    }
}
