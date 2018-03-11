package JUnit;

import Action.UserAction;
import Bean.User;
import Service.TopicService;
import Service.UserService;
import Util.TopicBean;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

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
        TopicBean bean = topicService.showTopicByType(1, "result_show");
        System.out.println(bean.getList().get(0).getTitle());
    }
}
