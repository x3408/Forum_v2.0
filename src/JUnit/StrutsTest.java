package JUnit;

import Bean.Topic;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import Util.TopicBean;
import Util.TopicTypeBean;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class StrutsTest {
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "topicService")
    private TopicService topicService;

    @Test
    public void serviceTest() {
        Boolean flag = userService.checkUser("xc");
        System.out.println(flag);
    }

    @Test
    public void showTopicByTypeTest() {

        //过滤一对多实体对象
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
            public boolean apply(Object source, String name, Object value) {
                if (name.equals("reverts")) {
                    return true;
                } else {
                    return false;
                }
            }
        });

        TopicBean topicBean = topicService.showTopicByType(1, "result_show");
        List<Topic> topicList = topicBean.getList();
        List<User> userList = new ArrayList<>();
        for (int i=0;i < topicList.size(); i++) {
            User user = userService.findUserById(topicList.get(i).getUid().toString());
            userList.add(user);
        }

        String s1 = JSONArray.fromObject(topicList,config).toString();
        String s2 = JSONArray.fromObject(userList).toString();

        String data = s1.substring(0, s1.length()-1) + "," + s2.substring(1,s2.length());

        System.out.println(data);
    }

    @Test
    public void findTopicCountByUserTest() {
        User user = new User();
        user.setUid("1");
        topicService.findTopicCountByUser(user);
    }

    @Test
    public void findTopicByUserTest() {
        List<Topic> topicByUser = topicService.findTopicByUser("1");
        System.out.println(topicByUser.get(0).getContent());
    }

    @Test
    public void addTopicTest() {
        Topic topic = new Topic();
        topic.setUid("1");
        topic.setContent("<p>Hello</p>");
    }

    @Test
    public void findTopicTypeListTest() {
        List<TopicTypeBean> topicTypeList = topicService.findTopicTypeList();
        System.out.println(topicTypeList.get(0).getTypeName());
    }

    @Test
    public void findTopicByIdTest() {
        Topic topic = topicService.showTopicById(1);
        System.out.println(topic.getContent());
    }

    @Test
    public void findTopicByKeywordTest() {
        TopicBean a = topicService.findTopicByKeyword("a", 1);
        System.out.println(a.getList().size());
    }
}
