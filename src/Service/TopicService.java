package Service;

import Bean.Topic;
import Bean.User;
import Util.TopicBean;
import Util.TopicTypeBean;

import java.util.List;


public interface TopicService {
    TopicBean showTopicByType(Integer page, String type,Integer limit);

    Integer findTopicCountByUser(User user);

    List<Topic> findTopicByUser(String showUserId);

    boolean addTopic(Topic topic, User user);

    List<TopicTypeBean> findTopicTypeList();

    Topic showTopicById(Integer tid);

    TopicBean findTopicByKeyword(String keyword, Integer page);
}
