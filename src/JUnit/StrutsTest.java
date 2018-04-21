package JUnit;

import Bean.Topic;
import Bean.User;
import Service.PersonService;
import Service.TopicService;
import Service.UserService;
import Util.Message;
import Util.TopicBean;
import Util.TopicTypeBean;
import Util.UserBean;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class StrutsTest {
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "topicService")
    private TopicService topicService;
    @Resource(name = "personService")
    private PersonService personService;

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
                if (name.equals("comments")) {
                    return true;
                } else {
                    return false;
                }
            }
        });

        TopicBean topicBean = topicService.showTopicByType(1, "result_show", 5);
        List<Topic> topicList = topicBean.getList();
        List<User> userList = new ArrayList<>();
        for (int i=0;i < topicList.size(); i++) {
            User user = userService.findUserById(topicList.get(i).getUid().toString());
            userList.add(user);
        }

        String s1 = JSONArray.fromObject(topicList,config).toString();
        String s2 = JSONArray.fromObject(userList,config).toString();

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

    @Test
    public void findUserByKeywordTest() {
        UserBean bean = userService.findUserByKeyword("xc", 1);

        System.out.println(JSONArray.fromObject(bean.getList()).toString());
    }

    @Test
    public void checkStatusTest() {
        System.out.println(userService.checkStatus("2", "1"));
    }

    @Test
    public void unFollowTest() {
        User user = new User();
        user.setUid("2");
    }

    @Test
    public void showMessageTest() {
        User user = new User();
        user.setUid("297e9494627185010162719571510000");
        List<Message> messages = personService.showMessage(user, "297e949462718501016271d4a2ea0001");
        String message = JSONArray.fromObject(messages).toString();
        System.out.println(message);
    }

    @Test
    public void getMessageTitleByUserTest() {
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter() {
            public boolean apply(Object source, String name, Object value) {
                if (name.equals("comments"))
                    return true;
                return false;
            }
        });


        User user = new User();
        user.setUid("297e9494627185010162719571510000");
        List<Bean.Message> messages = personService.showMessageTitleByUser(user, 1);
        List<User> userList = new ArrayList<>();
        User temp = new User();
        for (int i=0;i < messages.size(); i++) {
            temp.setUid(messages.get(i).getSend_id());
            User send_id = personService.findAllData(temp);
            userList.add(send_id);
        }
        String messageTitle = JSONArray.fromObject(messages).toString();
        String userInfo = JSONArray.fromObject(userList,config).toString();

        String data = messageTitle.substring(0, messageTitle.length()-1) + "," + userInfo.substring(1,userInfo.length());
        System.out.println(data);
    }
    @Test
    public void addMessageTest() {
        User user = new User();
        user.setUid("297e9494627185010162719571510000");
        personService.addMessage(user, "297e949462718501016271d4a2ea0001","测试");
    }
}
