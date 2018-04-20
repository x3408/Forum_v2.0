package Util;

import Bean.Topic;
import Bean.User;
import Dao.TopicDao;
import Dao.UserDao;

import java.util.List;

/*
该类为实现瀑布流 显示文章摘要  原理还是分页
 */
public class TopicBean {
    //当前页数
    private Integer page;
    //每次动态添加几条数据数
    private Integer limit;
    //总记录数
    private Integer totalCount;
    //总页数
    private Integer totalPage;

    private List<Topic> list;

    private TopicDao topicDao;

    private String keyword;


    public TopicBean showTopicByType(Integer page, String type,Integer limit) {
        this.page = page;
        if(page == null)
            page = 1;

        if (limit == null) {
            this.limit = 5;
        }

        int start = (page - 1) * limit;

        totalCount = topicDao.getTotalCountByType(type);

        if (totalCount % limit == 0)
            totalPage = totalCount / limit;
        else
            totalPage = totalCount / limit + 1;

        list = topicDao.getTopicByType(start, limit, type);

        return this;
    }



    public TopicBean showTopicByKeyword(Integer page, String keyword) {
        this.page = page;
        this.keyword = keyword;
        if (limit == null) {
            this.limit = 6;
        }

        int start = (page - 1) * limit;

        totalCount = topicDao.getTotalCountByTitle(keyword);

        if (totalCount % limit == 0)
            totalPage = totalCount / limit;
        else
            totalPage = totalCount / limit + 1;

        list = topicDao.getTopicByTitle(start, limit, keyword);

        return this;
    }



    public Integer getPage() {
        return page;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public Integer getTotalCount() {
        return totalPage;
    }

    public List<Topic> getList() {
        return list;
    }

    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
