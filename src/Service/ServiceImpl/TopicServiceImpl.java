package Service.ServiceImpl;

import Bean.Topic;
import Bean.User;
import Dao.TopicDao;
import Service.TopicService;
import Util.TopicBean;
import Util.TopicTypeBean;
import org.apache.struts2.ServletActionContext;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TopicServiceImpl implements TopicService{
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
        //测试使用代码
        /*if(user == null) {
            user = new User();
            user.setUid("1");
        }*/

        topic.setUid(user.getUid());

        //存入数据库
        return topicDao.addTopic(topic);
    }

    @Override
    public List<TopicTypeBean> findTopicTypeList() {
        //调用dao获得所有类型名集合
        List<String> typeNameList =  topicDao.findTopicTypeList();
        //创建TopicTypeBean对象集合
        List<TopicTypeBean> list = new ArrayList<>();

        //封装
        for(int i=0; i < typeNameList.size(); i++) {
            TopicTypeBean bean = new TopicTypeBean();
            String data = typeNameList.get(i);
            switch (data) {
                case "result_show":
                    bean.setTypeName("成果展示");
                    bean.setType(data);
                    break;
                case "training_experience":
                    bean.setTypeName("训练心得");
                    bean.setType(data);
                    break;
                case "diet_plan":
                    bean.setTypeName("饮食计划");
                    bean.setType(data);
                    break;
                case "appliance_use":
                    bean.setTypeName("器具使用");
                    bean.setType(data);
                    break;
                case "action":
                    bean.setTypeName("动作要领");
                    bean.setType(data);
                    break;
                case "diary":
                    bean.setTypeName("健身日记");
                    bean.setType(data);
                    break;
                default:
                    bean.setTypeName("");
                    bean.setType("");
            }
            list.add(bean);
        }
       return list;
    }

    @Override
    public Topic showTopicById(Integer tid) {
        return topicDao.findTopicById(tid);
    }

    @Override
    public TopicBean findTopicByKeyword(String keyword, Integer page) {
        return topicBean.showTopicByKeyword(page, keyword);
    }

    private String saveTopicContent(Topic topic, Date time) {
        //将文章内容存储到特定文件中
        String savePath = ServletActionContext.getServletContext().getRealPath("/") + "TopicContent/";
        String urlPath = "/TopicContent/";

        //测试使用
//        String savePath =  "/TopicContent/";


        //获得当天日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date()) + "/";
        //组成新保存路径
        savePath += ymd;
        urlPath += ymd;

        File uploadDir = new File(savePath);
        if (!uploadDir.exists())
            //创建文件夹
            uploadDir.mkdirs();

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String FileName = topic.getUid() + df.format(time) + ".html";

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
        return urlPath + FileName;
    }


    public void setTopicBean(TopicBean topicBean) {
        this.topicBean = topicBean;
    }

    public void setTopicDao(TopicDao topicDao) {
        this.topicDao = topicDao;
    }
}
