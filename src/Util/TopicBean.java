package Util;

import Bean.Topic;
import Dao.TopicDao;

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


    public TopicBean showTopicByType(Integer page, String type) {
        this.page = page;

        if (limit == null) {
            this.limit = 4;
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
}