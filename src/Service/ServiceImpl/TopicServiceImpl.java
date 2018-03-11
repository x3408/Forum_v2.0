package Service.ServiceImpl;

import Service.TopicService;
import Util.TopicBean;

public class TopicServiceImpl implements TopicService {
    private TopicBean topicBean;
    @Override
    public TopicBean showTopicByType(Integer page, String type) {
        return this.topicBean.showTopicByType(page, type);
    }

    public void setTopicBean(TopicBean topicBean) {
        this.topicBean = topicBean;
    }
}
