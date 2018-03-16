package Service.ServiceImpl;

import Bean.Topic;
import Bean.User;
import Dao.TopicDao;
import Service.TopicService;
import Util.TopicBean;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.*;
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
    public boolean addTopic(Topic topic, User user) {
        //发布时间
        Date time = new Date();
        topic.setTime(time);

        //初始浏览数
        topic.setViewCount(0);

        //将文章内容存储到特定文件中
        String address = saveTopicContent(topic, time);

        //调用方法获取摘要
        Document doc = Jsoup.parse(topic.getContent());
        Elements element = doc.getElementsByTag("p");
        //获得所有p标签的内容
        String content = element.text();
        //截取内容作为摘要
        if (content.length() > 50) {
            topic.setDescriptive(content.substring(0, 50));
        } else {
            topic.setDescriptive(content);
        }


        //设置文章内容的文件地址
        topic.setContent(address);

        //设置文章用户
        topic.setUid(user.getUid());

        //存入数据库
        return topicDao.addTopic(topic);
    }

    private String saveTopicContent(Topic topic, Date time) {
        //将文章内容存储到特定文件中
        String savePath = ServletActionContext.getServletContext().getRealPath("/") + "TopicContent/";

        //测试使用
//        String savePath =  "/TopicContent/";


        //获得当天日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        //组成新保存路径
        savePath += ymd;

        File uploadDir = new File(savePath);
        if (!uploadDir.exists())
            //创建文件夹
            uploadDir.mkdirs();

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String FileName = topic.getUid() + df.format(time) + ".txt";

        File file = new File(savePath, FileName);

        BufferedReader reader = new BufferedReader(new StringReader(topic.getContent()));
        BufferedWriter writer = null;
        try {
            writer = new BufferedWriter(new FileWriter(file));
            char buf[] = new char[1024];         //字符缓冲区
            int len;
            while ((len = reader.read(buf)) != -1) {
                writer.write(buf, 0, len);
            }
            writer.flush();
            writer.close();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return savePath + FileName;
    }


    public void setTopicBean(TopicBean topicBean) {
        this.topicBean = topicBean;
    }

    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }
}
