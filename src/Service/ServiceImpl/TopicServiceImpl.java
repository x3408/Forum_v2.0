package Service.ServiceImpl;

import Bean.Topic;
import Bean.User;
import Dao.TopicDao;
import Service.TopicService;
import Util.TopicBean;
import org.apache.struts2.ServletActionContext;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

    @Override
    public void addTopic(Topic topic) {
        //保存路径
        String savePath = this.getClass().getClassLoader().getResource("/").getPath() + "/TopicContent/";


        //创建文件夹
        File file = new File(savePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
    }


    public void setTopicBean(TopicBean topicBean) {
        this.topicBean = topicBean;
    }

    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }
}
