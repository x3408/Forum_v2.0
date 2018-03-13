package Service.ServiceImpl;

import Bean.Topic;
import Bean.User;
import Dao.TopicDao;
import Service.TopicService;
import Util.TopicBean;

import java.awt.*;
import java.util.List;

public class TopicServiceImpl implements TopicService {
    private TopicBean topicBean;
    private TopicDao topicDao;
    @Override
    public TopicBean showTopicByType(Integer page, String type) {
        return this.topicBean.showTopicByType(page, type);
    }

    @Override
    public Integer findTopicCountByUser(User user) {
        return topicDao.findTopicCountByUser(user.getUid());
    }

    @Override
    public List<Topic> findTopicByUser(String showUserId) {
        return topicDao.findTopicByUser(showUserId);
    }


    public void setTopicBean(TopicBean topicBean) {
        this.topicBean = topicBean;
    }

    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }
}
