package Service;

import Bean.User;
import Util.TopicBean;

public interface TopicService {
    TopicBean showTopicByType(Integer page, String type);

    Integer findTopicCountByUser(User user);
}
