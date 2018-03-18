package Service;

import Bean.Topic;
import Bean.User;
import Util.TopicBean;

import java.util.List;


public interface TopicService {
    TopicBean showTopicByType(Integer page, String type);

    Integer findTopicCountByUser(User user);

    List<Topic> findTopicByUser(String showUserId);

    boolean addTopic(Topic topic, User user);
}
